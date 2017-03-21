require 'rails_helper'

RSpec.describe "suggestions/index", type: :view do
  before(:each) do
    assign(:suggestions, [
      Suggestion.create!(
        :info => "MyText",
        :user_id => 2
      ),
      Suggestion.create!(
        :info => "MyText",
        :user_id => 2
      )
    ])
  end

  it "renders a list of suggestions" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
