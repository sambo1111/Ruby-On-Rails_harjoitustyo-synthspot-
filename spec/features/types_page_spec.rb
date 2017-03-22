require 'rails_helper'

describe "Instrument types page" do
  it "lists existing instrument types" do

    FactoryGirl.create(:type, name:"Drum Machines")
    FactoryGirl.create(:type, name:"Sequencers")

    visit types_path
    expect(page).to have_content 'Drum Machines'
    expect(page).to have_content 'Sequencers'
  end

  it "allows user to go to instrument type's page" do

    FactoryGirl.create(:type, name:"Drum Machines", info:"jeps")

    visit types_path
    click_link "Drum Machines"

    expect(page).to have_content 'jeps'
  end

  it "allows admin to create new instrument type" do

    FactoryGirl.create(:user)

    visit signin_path
    fill_in('username', with:'admin')
    fill_in('password', with:'salainen')
    click_button('Log in')

    visit types_path
    click_link "New Instrument Type"
    fill_in('Name', with:'Synthesizers')
    fill_in('Info', with:'jepjep')
    click_button('Create Type')

    expect(Type.count).to eq(1)
    expect(page).to have_content 'Synthesizers'

  end

  it "regular user cant create new instrument type" do

    FactoryGirl.create(:user, username:"regularuser", admin:false)

    visit signin_path
    fill_in('username', with:'regularuser')
    fill_in('password', with:'salainen')
    click_button('Log in')

    visit types_path
    expect(page).not_to have_content 'New Instrument Type'
  end

  describe "when on instrument's page, " do

      it "lists all instruments that belong to this type and allows user to go to these instruments' pages" do

        type1 = FactoryGirl.create(:type, name:"Sequencers")
        manu1 = FactoryGirl.create(:manufacturer, name:"Arturia")
        FactoryGirl.create(:instrument, name:"Beatstep", manufacturer:manu1, type:type1)

        visit types_path
        click_link "Sequencers"

        expect(page).to have_content 'Beatstep'
        click_link "Beatstep"

        expect(page).to have_content 'Arturia'

      end
  end


end
