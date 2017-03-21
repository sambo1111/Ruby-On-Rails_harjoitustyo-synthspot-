require 'rails_helper'

RSpec.describe "suggestions/edit", type: :view do
  before(:each) do
    @suggestion = assign(:suggestion, Suggestion.create!(
      :info => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit suggestion form" do
    render

    assert_select "form[action=?][method=?]", suggestion_path(@suggestion), "post" do

      assert_select "textarea#suggestion_info[name=?]", "suggestion[info]"

      assert_select "input#suggestion_user_id[name=?]", "suggestion[user_id]"
    end
  end
end
