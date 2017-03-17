require 'rails_helper'

describe "Instruments page" do
  it "lists existing instruments" do

    FactoryGirl.create(:instrument, name:"TR-909")
    FactoryGirl.create(:instrument, name:"TR-808")

    visit instruments_path
    expect(page).to have_content 'TR-909'
    expect(page).to have_content 'TR-808'
  end

  it "allows user to go to instrument's page" do

    FactoryGirl.create(:instrument, name:"TR-909", info:"joujou")

    visit instruments_path
    click_link "TR-909"

    expect(page).to have_content "joujou"
  end
end
