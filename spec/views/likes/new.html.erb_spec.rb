require 'rails_helper'

RSpec.describe "likes/new", type: :view do
  before(:each) do
    assign(:like, Like.new(
      :instrument_setup_id => 1,
      :user_id => 1
    ))
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do

      assert_select "input#like_instrument_setup_id[name=?]", "like[instrument_setup_id]"

      assert_select "input#like_user_id[name=?]", "like[user_id]"
    end
  end
end
