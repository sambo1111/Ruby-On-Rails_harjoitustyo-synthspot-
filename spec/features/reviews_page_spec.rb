require 'rails_helper'

describe "Reviews page" do
  let!(:user) { FactoryGirl.create(:user, username:"eetvart", admin:false) }

  before :each do
    visit signin_path
    fill_in('username', with:'eetvart')
    fill_in('password', with:'salainen')
    click_button('Log in')

    inst = FactoryGirl.create(:instrument, name:"Jupiter-8")
    Review.create(topic:"jee", body:"jou", user:user, instrument:inst)
    visit instruments_path
    click_link "Jupiter-8"
    click_link "jee"

  end

  it "allows user to edit his review" do

    click_link "Edit"
    fill_in('Topic', with:"jeesus")
    click_button('Update Review')
    expect(page).to have_content("jeesus")

  end

  it "allows user to edit his review" do

    expect{
      click_link("Delete")
    }.to change{Review.count}.from(1).to(0)

  end
end
