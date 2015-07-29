class ObserversController < ApplicationController 
  def create
    @latitude = params["coords"]["latitude"].to_f
    @longitude = params["coords"]["longitude"].to_f
    @pollution = params["pollution"].to_f
    @stars = Star.all_by_apparent_magnitude(@pollution)
    obs = Observer.new(@latitude, @longitude, @stars)
    can_see = obs.starsVisible

    @star_points = can_see.map do |star|

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