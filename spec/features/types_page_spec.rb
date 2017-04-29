require 'rails_helper'

describe "Instrument types page" do

  describe "allows admin to" do

    let!(:user){FactoryGirl.create(:user)}

    before :each do
      visit signin_path
      fill_in('username', with:'admin')
      fill_in('password', with:'salainen')
      click_button('Log in')
    end

    it "create new instrument type" do

      visit adminpanel_path
      click_link "New Instrument Type"
      fill_in('Name', with:'Synthesizers')
      fill_in('Info', with:'jepjep')
      click_button('Create Type')

      expect(Type.count).to eq(1)
      expect(page).to have_content 'Synthesizers'
    end

    it "destroy a type" do

      type = FactoryGirl.create(:type)

      visit '/types/1'

      expect{click_link("Destroy")}.to change{Type.count}.from(1).to(0)
      expect(page).not_to have_content("Drum Machines")
    end

    it "edit a type" do

      FactoryGirl.create(:type)

      visit '/types/1'
      click_link "Edit"

      fill_in('Name', with:"Rummut")
      fill_in('Info', with:"very kool, nice")
      click_button('Update Type')

      expect(page).to have_content("Type was successfully updated.")
      expect(page).to have_content("Rummut")
      expect(page).to have_content("very kool, nice")
    end

    it "displays error messages and doesnt save after unsuccesful edit" do

      FactoryGirl.create(:type)

      visit '/types/1'
      click_link "Edit"

      fill_in('Name', with:"")
      fill_in('Info', with:"very kool, nice")
      click_button('Update Type')

      expect(page).to have_content("Name is too short (minimum is 2 characters)")

      visit '/types/1'
      expect(page).to have_content("Drum Machines")
      expect(page).to have_content("joda joda")
    end

    it "displays error messages and doesnt save after unsuccesful create" do

      visit adminpanel_path
      click_link "New Instrument Type"
      fill_in('Name', with:'') #empty name
      fill_in('Info', with:'jepjep')
      click_button('Create Type')

      expect(Type.count).to eq(0)
      expect(page).to have_content 'Name is too short (minimum is 2 characters)'
    end
  end

  it "lists existing instrument types" do

    FactoryGirl.create(:type, name:"Drum Machines")
    FactoryGirl.create(:type, name:"Sequencers")

    visit types_path
    expect(page).to have_content 'Drum Machines'
    expect(page).to have_content 'Sequencers'
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

  describe "when on type's page, " do

      it "lists all instruments that belong to this type and allows user to go to these instruments' pages" do

        type1 = FactoryGirl.create(:type, name:"Sequencers")
        manu1 = FactoryGirl.create(:manufacturer, name:"Arturia")
        FactoryGirl.create(:instrument, name:"Beatstep", manufacturer:manu1, type:type1)

        visit '/types/1'

        expect(page).to have_content 'Beatstep'
        click_link "Beatstep"

        expect(page).to have_content 'Arturia'

      end
  end


end
