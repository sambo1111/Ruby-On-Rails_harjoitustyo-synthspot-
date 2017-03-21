require 'rails_helper'

RSpec.describe "instrument_setups/index", type: :view do
  before(:each) do
    assign(:instrument_setups, [
      InstrumentSetup.create!(
        :name => "Name",
        :info => "MyText",
        :user_id => 2
      ),
      InstrumentSetup.create!(
        :name => "Name",
        :info => "MyText",
        :user_id => 2
      )
    ])
  end

  it "renders a list of instrument_setups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
