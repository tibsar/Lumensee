class ObserversController < ApplicationController 
  def create
    @latitude = params["coords"]["latitude"].to_f
    @longitude = params["coords"]["longitude"].to_f
    @stars = []
    obs = Observer.new(@latitude, @longitude, @stars)
    binding.pry
    #@pollution = params["pollution"].to_f
  end 
end 