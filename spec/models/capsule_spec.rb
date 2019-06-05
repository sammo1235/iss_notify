require 'rails_helper'

RSpec.describe Capsule, type: :model do
  let(:fixture) { {"capsule_serial"=>"C202", "capsule_id"=>"dragon2",
    "status"=>"active", "original_launch"=>nil, "original_launch_unix"=>nil,
     "missions"=>[], "landings"=>0, "type"=>"Dragon 2.0", "details"=>"Capsule
      used to qualify Dragon 2's environmental control and life support systems.",
       "reuse_count"=>0}
}

  it 'returns capsules' do
    capsule = Capsule.new(fixture)
    expect(capsule.status).to eq("active")
  end
end
