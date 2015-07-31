class ObserversController < ApplicationController 
  def create
    obs = Observer.new(observer_params)
    @stars = obs.plot_visible_stars
    @pollution = observer_params[:pollution]

    @x_array = obs.stars.collect{|s| s.position.x}
    @average_x = @x_array.inject{ |sum, el| sum + el }.to_f / @x_array.size

    @y_array = obs.stars.collect{|s| s.position.y}
    @average_y = @y_array.inject{ |sum, el| sum + el }.to_f / @y_array.size

    @z_array = obs.stars.collect{|s| s.position.z}
    @average_z = @z_array.inject{ |sum, el| sum + el }.to_f / @z_array.size


    @x_mean = (@x_array.inject(:+))/(@x_array.length.to_f)
    @x_sum_of_deviations = @x_array.inject(0){|accum, i| accum + (i - @x_mean) ** 2 }
    @x_standard_deviation = Math.sqrt(@x_sum_of_deviations/(@x_array.length-1).to_f)


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