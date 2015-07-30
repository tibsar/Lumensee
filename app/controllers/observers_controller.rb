class ObserversController < ApplicationController 
  def create
    obs = Observer.new(observer_params)
    @stars = obs.plot_visible_stars
    @pollution = observer_params[:pollution]
    @latitude = observer_params[:latitude]
    @longitude = observer_params[:longitude]
    @x_array = obs.stars.collect{|s| s.position.x}
    @average_x = @x_array.inject{ |sum, el| sum + el }.to_f / @x_array.size

    @y_array = obs.stars.collect{|s| s.position.y}
    @average_y = @y_array.inject{ |sum, el| sum + el }.to_f / @y_array.size

    @z_array = obs.stars.collect{|s| s.position.z}
    @average_z = @z_array.inject{ |sum, el| sum + el }.to_f / @z_array.size

    @stars = obs.plot_visible_stars
    respond_to do |format|
      format.js
    end
  end

  private
  def observer_params
    params.require(:observer).permit(:latitude, :longitude, :pollution)
  end


end 