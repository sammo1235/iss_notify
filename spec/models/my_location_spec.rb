require 'rails_helper'

RSpec.describe MyLocation, type: :model do
  let(:my_loc) { MyLocation.new }
  
  describe "#my_coords" do
    it 'returns an array of coordinates' do
      location = MyLocation.new
      expect(location.my_coords).to be_instance_of(Array)
    end
    
    it "gives a latitude within expected values" do
      expect(my_loc.my_coords.first).to be_between(-90, 90).inclusive
    end
      
    it "gives a longitude within expected values" do
      expect(my_loc.my_coords.last).to be_between(-180, 180).inclusive
    end
  end
  
  let(:my_fake_loc) { MyLocation.new }
  let(:iss_fake_loc) { IssLocation.new }
  
  describe "#in_range?" do
    it 'returns true when both coordinates are within 5 degrees' do
      expect(my_fake_loc.in_range?(iss_fake_loc)).to be true
    end
  end
end
