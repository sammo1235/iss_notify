class IssLocation
  attr_accessor :iss_lat, :iss_long
  include HTTParty
  base_uri 'http://api.open-notify.org'

  def initialize
    iss_location = self.class.get('/iss-now.json')
    @iss_lat = iss_location['iss_position']['latitude'].to_f 
    @iss_long = iss_location['iss_position']['longitude'].to_f
  end
end