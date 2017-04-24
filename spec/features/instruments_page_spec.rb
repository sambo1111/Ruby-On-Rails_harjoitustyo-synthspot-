require 'rails_helper'

describe "Instruments page" do
  it "lists existing instruments" do

    FactoryGirl.create(:instrument, name:"TR-909")
    FactoryGirl.create(:instrument, name:"TR-707")

    visit instruments_path
    expect(page).to have_content 'TR-909'
    expect(page).to have_content 'TR-707'
  end

  it "allows user to go to instrument's page" do

    FactoryGirl.create(:instrument, name:"TR-909", info:"joujou")

    visit instruments_path

    click_link "TR-909"

    expect(page).to have_content "joujou"
  end

  describe "for admin" do

    let!(:user) { FactoryGirl.create(:user) }

    before :each do

      visit signin_path
      fill_in('username', with:'admin')
      fill_in('password', with:'salainen')
      click_button('Log in')
    end

    it "allows to create new instrument" do

      FactoryGirl.create(:manufacturer, name:"Korg")
      FactoryGirl.create(:type, name:"Romplers")
      visit adminpanel_path
      click_link "New Instrument"
      fill_in('Name', with:'Wavestation')
      fill_in('Year', with:2000)
      fill_in('Info', with:'jees')
      select("Korg", from:"instrument_manufacturer_id")
      select("Romplers", from:"instrument_type_id")

      click_button('Create Instrument')

      expect(Manufacturer.count).to eq(1)
      expect(page).to have_content 'Wavestation'

    end

    it "allows to delete instrument from instrument's page" do

      FactoryGirl.create(:instrument)
      visit instruments_path
      click_link "TR-909"

      expect{
        click_link("Destroy")
      }.to change{Instrument.count}.from(1).to(0)

    end

    it "allows admin to edit instrument from instrument's page" do
      FactoryGirl.create(:instrument)
      visit instruments_path
      click_link "TR-909"
      expect(page).to have_content 'yoda yoda'

      click_link "Edit"
      fill_in('Info', with:'yea boi')
      click_button("Update Instrument")

      expect(page).to have_content 'Instrument was successfully updated.'
      expect(page).to have_content 'yea boi'

    end
  end

  describe "regular user" do

    let!(:user) { FactoryGirl.create(:user, username:"regularuser", admin:false) }

    before :each do
      visit signin_path
      fill_in('username', with:'regularuser')
      fill_in('password', with:'salainen')
      click_button('Log in')
    end

    it "cant create new instrument" do

      visit instruments_path
      expect(page).not_to have_content 'New Instrument'
    end

    it "can create a review for instrument" do

      FactoryGirl.create(:instrument, name:"Jupiter-6")

      visit instruments_path
      click_link "Jupiter-6"
      click_link "Write a review"

      fill_in('Topic', with:'Very nice')
      fill_in('Body', with:'jeesjees')
      fill_in('Score', with:4)
      click_button('Create Review')

      expect(page).to have_content('Very nice')

    end
  end
end
