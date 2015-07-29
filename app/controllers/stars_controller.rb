
class StarsController < ApplicationController

  def index
    @stars = Star.all_by_apparent_magnitude(6.0)
    @star_coordinates = @stars.map{|star| star.position.to_a}

    respond_to do |format|
      format.js
    end

  end



end
