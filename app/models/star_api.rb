class StarApi

  BASE_URL = "http://star-api.herokuapp.com/api/v1/stars"

  def initialize
    require 'open-uri'
  end

  def stars_by_apparent_magnitude(max)
    base_url = "http://star-api.herokuapp.com/api/v1/stars"
    @all_stars = []
    page = 1
    final_url = base_url + "?max[appmag]=#{max}&page=#{page}"
    data = JSON.parse(open(final_url).read)
    while data != []
      @all_stars << data
      page += 1
      final_url = base_url + "?max[appmag]=#{max}&page=#{page}"
      data = JSON.parse(open(final_url).read)
    end
    @all_stars.flatten
  end


end