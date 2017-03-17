require 'rails_helper'

describe "Manufacturers page" do
  it "lists existing manufacturers" do

    FactoryGirl.create(:manufacturer, name:"Roland")
    FactoryGirl.create(:manufacturer, name:"Korg")

    visit manufacturers_path
    expect(page).to have_content 'Roland'
    expect(page).to have_content 'Korg'
  end

  it "allows user to go to manufacturer's page" do

    FactoryGirl.create(:manufacturer, name:"Roland", info:"yadda")

    visit manufacturers_path
    click_link "Roland"

    expect(page).to have_content "yadda"
  end
end
