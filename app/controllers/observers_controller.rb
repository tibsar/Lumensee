class ObserversController < ApplicationController 
  def create
    binding.pry
    @latitude = params["coords"]["latitude"].to_f
    @longitude = params["coords"]["longitude"].to_f
    @pollution = params["pollution"].to_f
    @stars = Star.all_by_apparent_magnitude(@pollution)
    obs = Observer.new(@latitude, @longitude, @stars)
    can_see = obs.starsVisible
  end 
end 