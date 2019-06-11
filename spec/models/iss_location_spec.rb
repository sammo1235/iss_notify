require 'rails_helper'

describe IssLocation do
  let(:iss_loc) { IssLocation.new }
  
  describe "#iss_coords" do
    it "returns coordinates of the iss" do
      expect(iss_loc.iss_coords).to be_instance_of(Array)
    end
  
    it "gives a latitude within expected values" do
      expect(iss_loc.iss_coords.first).to be_between(-90, 90).inclusive
    end
    
    it "gives a longitude within expected values" do
      expect(iss_loc.iss_coords.last).to be_between(-180, 180).inclusive
    end
  end
end