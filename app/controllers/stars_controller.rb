
class StarsController < ApplicationController

  def index
    @stars = Star.all_by_apparent_magnitude(6.0)

    @star_points = @stars.map do |star|

      radius = 4*(1.25**(6.5-star.appmag)).round(2)

      {
          marker: {radius: radius},
          x: star.position.x,
          y: star.position.y,
          z: star.position.z
      }

    end

    @star_points.shift



    respond_to do |format|
      format.js
    end

  end



end
