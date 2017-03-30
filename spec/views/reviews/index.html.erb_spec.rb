require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :topic => "Topic",
        :body => "MyText",
        :score => 2,
        :user_id => 3,
        :instrument_id => 4
      ),
      Review.create!(
        :topic => "Topic",
        :body => "MyText",
        :score => 2,
        :user_id => 3,
        :instrument_id => 4
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => "Topic".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
