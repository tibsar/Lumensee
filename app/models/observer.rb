class Observer

  attr_reader :stars

  # r is the distance from the Earth to the Sun.
  # Ruby Math module operates in radians
  # 2*PI radians equals 360 degrees
  # Displacement of the Earth along its orbit from one day to the next
  # is (2*PI radians) / 365
  # Current angle can be calculated by multiplying the angular displacement of a day
  # by the current day within the year relative to some defined day=0
  # Given a day, thereby a degree, an (x,y) can be found along the orbit.
  # The slope of the radius line between the earth and the sun can be found by:
  # [(y2)-(y1)] / [(x2)-(x1)].  Given that the sun is at the origin: y/x
  # The tangent line has the inverse slope with the opposite sign. - x/y
  # The equation of the tangent line is then found with y = mx + b
  # find if a coordinate is on one side of the tangent line or the other using the equation:


  # location on the orbit given an angle t:
  # x=r*cos(t)
  # y=r*sin(t)

  # Class Constants
  RadiansInCircle  = 2 * Math::PI
  RadiansPerDay    = RadiansInCircle / 365
  RadiusEarthOrbit = 4.8481*(10**-6) # 1 Astronomical unit converted to parsecs
  FLATNESS = (1.0/298.257)
  SEMI_MAJOR_AXIS = 6378.1363
  PHI_NAUGHT = 1.6180339887499
  RADIANS_OF_ANGLE = -4.1887902

  @@all = []

  def initialize(variables = {})
    @date = Time.now.yday - 1 #returns integer representing the day in the year 1..366
    @latitude = variables[:latitude].to_f
    @longitude = variables[:longitude].to_f
    @pollution = variables[:pollution].to_f
    @stars = Star.all_by_apparent_magnitude(@pollution)

    self.calculate_plane

    @@all << self
  end

  def locate
    # displacement in radians from one day to the next
    radians_for_date  = RadiansPerDay * @date
    # (x,y) coordinates for a date
    @x = RadiusEarthOrbit * Math::cos(radians_for_date)
    @y = RadiusEarthOrbit * Math::sin(radians_for_date)
    @z = 0.0
  end

  def calculate_plane
    delta_phi = @latitude - PHI_NAUGHT
    local_radius = (1.0 - (FLATNESS * (Math::sin(@latitude)**2))) * SEMI_MAJOR_AXIS
    phi_radius = local_radius * Math::cos(@latitude)
    
    #non-rotated
    a = local_radius * Math::sin(delta_phi)
    b = phi_radius * (1.0 - Math::cos(delta_phi)) * Math::sin(PHI_NAUGHT)
    c = phi_radius * Math::sin(delta_phi)

    #rotated 
    @a = a 
    @b = (b * Math::cos(RADIANS_OF_ANGLE)) - (c * Math::sin(RADIANS_OF_ANGLE))  
    @c = (c * Math::cos(RADIANS_OF_ANGLE)) + (b * Math::sin(RADIANS_OF_ANGLE)) 
    #<a, b, c> - normal to plane in earth's coordinates
  end

  def plot_visible_stars
    self.stars_visible.reject{ |s| s.label == "Sun" }.map{ |star| star.generate_chart_point }
  end

  def stars_visible
    @stars_visible ||= @stars.select{ |star| see_star?(star) }
  end


  def see_star?(star)
    # (point to test) dot (plane normal) = 0 => Point is on the plane
    # (point to test) dot (plane normal) > 0 => Point is on the same side as the normal vector
    # (point to test) dot (plane normal) < 0 => Point is on the opposite side of the normal vector
    dot_product = (@a * star.position.x) + (@b * star.position.y) + (@c * star.position.z)

    dot_product > 0 ? true : false
  end

  def self.all 
    @@all
  end 

end