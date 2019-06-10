class MyLocation
  include HTTParty
  base_uri 'http://api.ipstack.com'

  def initialize
    @my_location = self.class.get(Rails.application.credentials.aws[:access_key_id])
  end
  
  def my_coords
    @my_lat_long = []
    @my_lat_long << @my_location['latitude'] << @my_location['longitude']
  end
  
  def in_range?(other)
    iss_lat = other.my_coords.first
    iss_long = other.my_coords.last
    my_coords.first.between?(iss_lat - 5, iss_lat + 5) && my_coords.last.between?(iss_long - 5, iss_long + 5)
  end
end