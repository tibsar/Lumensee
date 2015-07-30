class Star
  attr_reader :label, :appmag, :position

  @@api = StarApi.new

  Position = Struct.new(:x, :y, :z)

  def initialize(attributes_hash)
    @label = attributes_hash["label"]
    @appmag = attributes_hash["appmag"]

    @position = Position.new(attributes_hash["x"], attributes_hash["y"], attributes_hash["z"])
  end

  def self.all_by_apparent_magnitude(max)
    @@api.stars_by_apparent_magnitude(max).collect{ |star| self.new(star) }
  end

  def relative_brightness_radius
    #This is a logarithmic calculation for the radius of the point on the chart
    4*(1.25**(6.5-self.appmag)).round(2)
  end

  def generate_chart_point
    {
        marker: {radius: self.relative_brightness_radius},
        x: self.position.x,
        y: self.position.y,
        z: self.position.z
    }
  end




end