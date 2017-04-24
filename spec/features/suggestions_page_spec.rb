require 'rails_helper'

describe "Suggestions page"  do

  describe "for admin users" do

    let!(:user) { FactoryGirl.create(:user) }

    before :each do
      Suggestion.create(topic:"newstuff", info:"jeezz", user:user)
      visit signin_path
      fill_in('username', with:'admin')
      fill_in('password', with:'salainen')
      click_button('Log in')
    end

    it "lists all suggestions" do
      click_link 'Admin Panel'
      click_link 'View Suggestions'
      expect(page).to have_content 'Pending suggestions'
      expect(page).to have_content 'newstuff'
      expect(page).to have_content 'admin'
    end

    it "allows admin to navigate to a suggestion's page" do
      click_link 'Admin Panel'
      click_link 'View Suggestions'
      click_link 'newstuff'
      expect(page).to have_content 'jeezz'
      expect(page).to have_content 'admin'
    end

    it "allows admin to remove suggestion from suggestion's page" do
      click_link 'Admin Panel'
      click_link 'View Suggestions'
      click_link 'newstuff'
      click_link 'Delete suggestion'
      expect(Suggestion.count).to eq(0)
    end
  end
end
