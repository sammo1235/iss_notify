class MyLocation
  include HTTParty
  base_uri 'http://api.ipstack.com'

  def initialize
    @my_location = self.class.get(Rails.application.credentials.aws[:access_key_id])
  end

  def lat
    @my_lat = @my_location['latitude']
  end

  def long
    @my_long = @my_location['longitude']
  end
  
  def iss_viewable?
    if @my_lat.between?(10..90)
      true
    else
      false
    end
  end
end