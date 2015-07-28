class EarthOrbit


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

  def initialize
    @date = Time.now.yday - 1 #returns integer representing the day in the year 1..366
  end

  def locate
    # displacement in radians from one day to the next
    radians_for_date  = RadiansPerDay * @date
    # (x,y) coordinates for a date
    @x = RadiusEarthOrbit * Math::cos(radians_for_date)
    @y = RadiusEarthOrbit * Math::sin(radians_for_date)
  end

  def tangent_line_points
    tangent_slope = -@x/@y
    b = @y - (tangent_slope * x)
    p2x = @x + (10**-5)
    p2y = (tangent_slope * p2x) + b

    [[@x,@y],[p2x,p2y]]
  end









end