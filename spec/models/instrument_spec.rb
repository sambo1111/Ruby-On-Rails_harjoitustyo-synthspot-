require 'rails_helper'

RSpec.describe Instrument, type: :model do
  it "is created correctly if given a proper name and style" do

    type1 = FactoryGirl.create(:type)
    i = Instrument.create name:"TR-808", type:type1

    expect(i).to be_valid
    expect(Instrument.count).to eq(1)

  end

  it "is not created if given improper name" do
    type1 = FactoryGirl.create(:type)

    i = Instrument.create name:"T", type:type1

    expect(i).not_to be_valid
    expect(Instrument.count).to eq(0)
  end

  it "is not created if not given a type" do
    i = Instrument.create name:"TR-808"
    expect(i).not_to be_valid
    expect(Instrument.count).to eq(0)
  end

  it "is found if searched with a right word" do
    i = FactoryGirl.create(:instrument, name:"TR-909")
    i = FactoryGirl.create(:instrument, name:"DR-550")

    result_instruments = Instrument.search("dR")

    expect(result_instruments.size).to eq(1)
    expect(result_instruments.first.name).to eq(i.name)
  end

  it "most famous finds the correct instrument" do

    user1 = FactoryGirl.create(:user, username:"erkki", admin:false)
    user2 = FactoryGirl.create(:user, username:"eetvart")
    user3 = FactoryGirl.create(:user, username:"jorma", admin:false)

    instrument1 = FactoryGirl.create(:instrument, name:"Monomachine")
    instrument2 = FactoryGirl.create(:instrument, name:"Machinedrum")
    instrument3 = FactoryGirl.create(:instrument, name:"Octatrack")

    setup1 = InstrumentSetup.create(name:"First", info:"blaa1", user:user1)
    setup2 = InstrumentSetup.create(name:"Second", info:"blaa2", user:user2)
    setup3 = InstrumentSetup.create(name:"Third", info:"blaa3", user:user2)
    setup4 = InstrumentSetup.create(name:"Fourth", info:"blaa4", user:user3)

    SetupInstrument.create(instrument:instrument1, instrument_setup:setup1)
    SetupInstrument.create(instrument:instrument2, instrument_setup:setup1)
    SetupInstrument.create(instrument:instrument1, instrument_setup:setup2)
    SetupInstrument.create(instrument:instrument1, instrument_setup:setup3)
    SetupInstrument.create(instrument:instrument2, instrument_setup:setup3)
    SetupInstrument.create(instrument:instrument3, instrument_setup:setup3)

    expect(Instrument.get_most_famous.name).to eq(instrument1.name)

  end
end
