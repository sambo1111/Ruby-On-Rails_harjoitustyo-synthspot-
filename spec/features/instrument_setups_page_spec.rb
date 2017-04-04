require 'rails_helper'

describe "Instrument setups page" do

  let!(:user) { FactoryGirl.create(:user, username:"eetvart", admin:false) }

  before :each do
    visit signin_path
    fill_in('username', with:'eetvart')
    fill_in('password', with:'salainen')
    click_button('Log in')

    FactoryGirl.create(:instrument, name:"Jupiter-8")
    visit instrument_setups_path
    click_link "New Instrument Setup"
    fill_in('Name', with:"Electro setup")
    fill_in('Info', with:"liibalaaba")
    click_button('Create Instrument setup')
  end

  it "allows user to create new instrument setup and add instruments to it" do

    expect(page).to have_content 'Electro setup'
    expect(page).to have_content 'Created by: eetvart'
    expect(InstrumentSetup.count).to eq(1)

    select("Jupiter-8", from:"setup_instrument_instrument_id")
    click_button('Create Setup instrument')

    expect(page).to have_content 'Jupiter-8'
  end

  it "allows user to add tags to the setup" do

    fill_in('tag_name', with:"best")
    click_button('Create Tag')

    expect(page).to have_content("#best")
  end

  it "allows user to destroy user's instrument setup" do

    select("Jupiter-8", from:"setup_instrument_instrument_id")
    click_button('Create Setup instrument')

    expect{
      click_link("Delete this setup")
    }.to change{InstrumentSetup.count}.from(1).to(0).and change{SetupInstrument.count}.from(1).to(0)

    expect(page).not_to have_content 'Jupiter-8'
  end
end
