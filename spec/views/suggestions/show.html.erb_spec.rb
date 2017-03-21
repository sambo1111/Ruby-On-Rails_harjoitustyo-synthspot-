require 'rails_helper'

RSpec.describe "suggestions/show", type: :view do
  before(:each) do
    @suggestion = assign(:suggestion, Suggestion.create!(
      :info => "MyText",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
