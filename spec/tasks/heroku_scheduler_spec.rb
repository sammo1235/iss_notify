require 'rails_helper'

describe "Task for Heroku scheduler: email when in_range? == true", type: :task do
  let(:my_loc) { [21.3022, 140.1232] }
  let(:iss_loc) { [23.903, 144.2339] }
  
  context "email sent because iss is in range" do
    xit "sends email and puts sending email" do
      expect(my_loc.in_range?(iss_loc)).to be true
    end
  end
  
end