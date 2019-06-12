class MyLocation
  attr_accessor :latitude, :longitude
  include HTTParty

  def initialize
    my_location = self.class.get(Rails.application.credentials.aws[:my_location_key])
    @latitude = my_location['latitude']
    @longitude = my_location['longitude']
  end
  
  def in_range?(other)
    iss_lat = other.iss_lat; iss_long = other.iss_long
    latitude.between?(iss_lat - 5, iss_lat + 5) && longitude.between?(iss_long - 5, iss_long + 5)
  end
end