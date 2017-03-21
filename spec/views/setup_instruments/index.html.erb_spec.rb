require 'rails_helper'

RSpec.describe "setup_instruments/index", type: :view do
  before(:each) do
    assign(:setup_instruments, [
      SetupInstrument.create!(
        :instrument_setup_id => 2,
        :instrument_id => 3
      ),
      SetupInstrument.create!(
        :instrument_setup_id => 2,
        :instrument_id => 3
      )
    ])
  end

  it "renders a list of setup_instruments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
