require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :topic => "Topic",
      :body => "MyText",
      :score => 2,
      :user_id => 3,
      :instrument_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Topic/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
