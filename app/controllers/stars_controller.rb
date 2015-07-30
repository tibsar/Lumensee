
class StarsController < ApplicationController

  def index
    @stars = Star.all_by_apparent_magnitude(6.0)

    @star_points = @stars.map do |star|

      {
          marker: {radius: star.relative_brightness_radius},
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
