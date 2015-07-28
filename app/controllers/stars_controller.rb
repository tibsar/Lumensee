class StarsController < ApplicationController

  def index
    @stars = Star.all_by_apparent_magnitude(6.0)
  end


end
