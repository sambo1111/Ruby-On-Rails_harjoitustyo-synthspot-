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

  it "is found if searched with a right word" do
    m1 = Manufacturer.create name:"Korg", year:1980
    m2 = Manufacturer.create name:"Roland", year:1980

    result_manufacturers = Manufacturer.search("kor")

    expect(result_manufacturers.size).to eq(1)
    expect(result_manufacturers.first.name).to eq(m1.name)

  end
end
