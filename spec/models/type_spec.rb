require 'rails_helper'

RSpec.describe Type, type: :model do
  it "is saved if given a proper name" do
    t = Type.create name:"Drum Machine"
    expect(t).to be_valid
    expect(Type.count).to eq(1)
  end

  it "is not saved if given an improper name" do
    t = Type.create name:"D"
    expect(t).not_to be_valid
    expect(Type.count).to eq(0)
  end

  it "is not saved if exists another with same name" do
    t = Type.create name:"Drum Machine"
    t1 = Type.create name:"Drum Machine"

    expect(t1).not_to be_valid
    expect(Type.count).to eq(1)
  end
end
