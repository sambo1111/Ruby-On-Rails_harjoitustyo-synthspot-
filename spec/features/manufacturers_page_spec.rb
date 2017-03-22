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

  describe "for admin" do

    let!(:user) { FactoryGirl.create(:user) }

    before :each do

      visit signin_path
      fill_in('username', with:'admin')
      fill_in('password', with:'salainen')
      click_button('Log in')
    end

    it "allows to create new manufacturer" do

      visit manufacturers_path
      click_link "New Manufacturer"
      fill_in('Name', with:'Dave Smith')
      fill_in('Year', with:2000)
      fill_in('Info', with:'joop')
      click_button('Create Manufacturer')

      expect(Manufacturer.count).to eq(1)
      expect(page).to have_content 'Dave Smith'

    end

    it "allows to delete a manufacturer from manufacturer's page" do

      FactoryGirl.create(:manufacturer)
      visit manufacturers_path
      click_link "Roland"

      expect{
        click_link("Destroy")
      }.to change{Manufacturer.count}.from(1).to(0)

    end

    it "allows to edit manufacturer from manufacturer's page" do

      FactoryGirl.create(:manufacturer)
      visit manufacturers_path
      click_link "Roland"
      expect(page).to have_content 'yadda yadda'

      click_link "Edit"
      fill_in('Info', with:'new info')
      click_button("Update Manufacturer")
      expect(page).to have_content 'Manufacturer was successfully updated.'
      expect(page).to have_content 'new info'
    end
  end

  it "regular user cant create new manufacturer" do

    FactoryGirl.create(:user, username:"regularuser", admin:false)

    visit signin_path
    fill_in('username', with:'regularuser')
    fill_in('password', with:'salainen')
    click_button('Log in')

    visit manufacturers_path
    expect(page).not_to have_content 'New Manufacturer'
  end
end
