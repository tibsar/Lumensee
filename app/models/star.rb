class Star
  attr_reader :label, :appmag

  @@api = StarApi.new

  def initialize(attributes_hash)
    @label = attributes_hash["label"]
    @appmag = attributes_hash["appmag"]
  end

  def self.all_by_apparent_magnitude(max)
    @@api.stars_by_apparent_magnitude(max).collect{ |star| self.new(star) }
  end

end