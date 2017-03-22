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
end
