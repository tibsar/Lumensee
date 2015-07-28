
class StarsController < ApplicationController

  def index
    @stars = Star.all_by_apparent_magnitude(6.0)
    byebug
    @star_coordinates = @stars.map{|star| star.position.to_a}


    respond_to do |f|
      f.js
    end
  end



end
