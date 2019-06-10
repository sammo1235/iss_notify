require 'rails_helper'

RSpec.describe MyLocation, type: :model do
  it 'returns coordinates' do
    location = MyLocation.new
    expect(location.my_coords).to eq([34.1049, -117.8132])
  end
end
