require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  it "is saved if given a proper name and a year" do
    m = Manufacturer.create name:"Roland", year:1990
    expect(m).to be_valid
    expect(Manufacturer.count).to eq(1)
  end

  it "is not saved if given an improper name" do
    m = Manufacturer.create name:"R", year:1990
    expect(m).not_to be_valid
    expect(Manufacturer.count).to eq(0)
  end

  it "is not saved if given an improper year" do
    m = Manufacturer.create name:"Roland", year:199
    expect(m).not_to be_valid
    expect(Manufacturer.count).to eq(0)
  end
end
