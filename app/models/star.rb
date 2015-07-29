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


end