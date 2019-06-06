class MyLocation
  include HTTParty
  base_uri 'http://api.ipstack.com'

  def initialize
    @my_location = self.class.get(Rails.application.credentials.aws[:access_key_id])
  end
  
  def my_coords
    @my_lat_long = []
    @my_lat_long << @my_location['latitude']
    @my_lat_long << @my_location['longitude']
  end
  
  def in_range?(other)
    iss_lat = other.iss_coords.first; iss_lat_low = iss_lat - 5; iss_lat_up = iss_lat + 5
    iss_long = other.iss_coords.last; iss_long_low = iss_long - 5; iss_long_up = iss_long + 5
    if my_coords.first.between?(iss_lat_low, iss_lat_up) && 
      my_coords.last.between?(iss_long_low, iss_long_up)
      debugger
      return true
    else
      false
    end
  end
end