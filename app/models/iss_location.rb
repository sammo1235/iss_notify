class IssLocation
  include HTTParty
  base_uri 'http://api.open-notify.org'

  def initialize
    @iss_location = self.class.get('/iss-now.json')
  end
  
  def iss_coords
    @iss_lat_long = []
    @iss_lat_long << @iss_location['iss_position']['latitude'].to_f
    @iss_lat_long << @iss_location['iss_position']['longitude'].to_f
  end
end