class StarApi

  BASE_URL = "http://star-api.herokuapp.com/api/v1/stars"

  def initialize
    require 'open-uri'
  end

  def stars_by_apparent_magnitude(max, page)
    data = JSON.load(open(BASE_URL + "?max[appmag]=#{max}&page=#{page}"))
    data.sort_by { |k| k["appmag"] }
  end


end