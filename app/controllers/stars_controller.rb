
class StarsController < ApplicationController

  def index
    # @stars = Star.all_by_apparent_magnitude(6.0)
    # @star_coordinates = @stars.map{|star| star.position.to_a}


    # @star_points = @stars.map do |star|
    #
    #   radius = 4*(1.25**(6.5-star.appmag)).round(2)
    #
    #   {
    #       marker: {radius: radius},
    #       x: star.position.x,
    #       y: star.position.y,
    #       z: star.position.z
    #   }
    #   end
    #
    # @star_points.shift

    # @star_points = [{:marker=>{:radius=>4.48}, :x=>-28.8776, :y=>41.9505, :z=>-28.1137}, {:marker=>{:radius=>4.48}, :x=>22.8057, :y=>-32.6752, :z=>-60.9665}].to_json


    # [{marker:{radius: 26}, x: 0, y: 0, z: 0}, {marker:{radius: 6}, x: 0, y: 50, z: 50}]

    respond_to do |format|
      format.js
    end

  end



end
