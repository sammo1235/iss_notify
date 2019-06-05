class MyLocation
  include HTTParty
  base_uri 'http://api.ipstack.com'

  def initialize
    @my_location = self.class.get('/134.201.250.155?access_key=968cd1d77c525c06bdd60bc82e611058')
  end

  def lat
    @my_lat = @my_location['latitude']
  end

  def long
    @my_long = @my_location['longitude']
  end
end
