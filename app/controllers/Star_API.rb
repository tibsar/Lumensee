class StarAPIsController < ApplicationController
  require 'open-uri'
  base_url = "http://star-api.herokuapp.com/api/v1/stars"
  
  def stars_by_app_mag(absmag)
    stars = JSON.parse(open(base_url).read)
    star_array = []
    stars.map {|star| star_array << star if star["absmag"] < absmag}
  end 

end 