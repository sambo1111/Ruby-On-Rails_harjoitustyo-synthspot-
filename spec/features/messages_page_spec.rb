require 'rails_helper'

describe 'Messages page' do

  describe 'For signed in users' do

    let!(:user) { FactoryGirl.create(:user, username:"eetvart", admin:false) }
    let!(:user2) { FactoryGirl.create(:user, username:"aatami", admin:false) }

    before :each do
      visit signin_path
      fill_in('username', with:'eetvart')
      fill_in('password', with:'salainen')
      click_button('Log in')
    end

    it 'lets user send a message correctly' do
      click_link('Messages')
      click_link('New message')

      fill_in('Topic', with:'Terve')
      fill_in('Body', with:'Tama on viesti')
      fill_in('Receiver name', with:'aatami')
      click_button('Create Message')

      click_link('Messages')
      expect(page).to have_content('Terve')
      expect(page).to have_content('aatami')
    end

    it 'when deleting a message, deletes only current user copy of message' do
      click_link('Messages')
      click_link('New message')

      fill_in('Topic', with:'Terve')
      fill_in('Body', with:'Tama on viesti')
      fill_in('Receiver name', with:'aatami')
      click_button('Create Message')

      click_link('Messages')
      click_link('Destroy')

      expect(page).not_to have_content('Terve')
      click_link('Sign Out')

      visit signin_path
      fill_in('username', with:'aatami')
      fill_in('password', with:'salainen')
      click_button('Log in')

      click_link('Messages')
      expect(page).to have_content('Terve')
      expect(page).to have_content('eetvart')
    end
  end

end
