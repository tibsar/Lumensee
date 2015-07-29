class Data 
  require 'open-uri'
  require 'JSON'
  attr_accessor :all_coords

  def stars_by_app_mag(lower_bound, upper_bound, page_start=1)
    @all_coords = []
    while page_start <2
      base_url = "http://star-api.herokuapp.com/api/v1/stars"
      final_url = base_url + "?min[appmag]="+ lower_bound.to_s + "&max[appmag]="+ upper_bound.to_s + "&page=" + page_start.to_s
      data = JSON.parse(open(final_url).read)
      all_x = data.collect{|star| star["x"]}
      all_y = data.collect{|star| star["y"]}
      all_z = data.collect{|star| star["z"]}
      page_coords = all_x.zip(all_y, all_z)
      @all_coords << page_coords
      page_start +=1 
    end
    @all_coords
  end 
end 

### The filtering mechanism will be key, or else we'll have dozens of pages 
###Is it realistic to claim that someone can see more than 500 stars??
### We should have a function to get page1 and page2 and that's it 
