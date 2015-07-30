class ObserversController < ApplicationController 
  def create
    @stars = Observer.new(observer_params).plot_visible_stars

    respond_to do |format|
      format.js
    end
  end

  private
  def observer_params
    params.require(:observer).permit(:latitude, :longitude, :pollution)
  end


end 