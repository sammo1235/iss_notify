require 'rails_helper'

describe IssLocation do
  
  it "returns coordinates off the iss" do
    iss_loc = IssLocation.new
    expect(iss_loc.iss_coords).to eq([23.1231, 112.1231])
  end
end