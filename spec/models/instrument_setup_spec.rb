require 'rails_helper'

RSpec.describe InstrumentSetup, type: :model do

  it "is found correctly with a right tag" do
    user1 = FactoryGirl.create(:user, username:"eetvart")
    user2 = FactoryGirl.create(:user, username:"aatami")

    setup1 = InstrumentSetup.create(name:"Best Setup", info:"blaa", user:user1)
    setup1 = InstrumentSetup.create(name:"Worst Setup", info:"blaa", user:user2)

    tag1 = Tag.create(name:"nice", instrument_setup:setup1)

    result_setups = InstrumentSetup.search("nice")

    expect(result_setups.size).to eq(1)
    expect(result_setups.first.name).to eq(setup1.name)

  end
end
