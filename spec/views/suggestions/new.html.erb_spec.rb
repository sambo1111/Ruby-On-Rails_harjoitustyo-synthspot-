require 'rails_helper'

RSpec.describe "suggestions/new", type: :view do
  before(:each) do
    assign(:suggestion, Suggestion.new(
      :info => "MyText",
      :user_id => 1
    ))
  end

  it "renders new suggestion form" do
    render

    assert_select "form[action=?][method=?]", suggestions_path, "post" do

      assert_select "textarea#suggestion_info[name=?]", "suggestion[info]"

      assert_select "input#suggestion_user_id[name=?]", "suggestion[user_id]"
    end
  end
end
