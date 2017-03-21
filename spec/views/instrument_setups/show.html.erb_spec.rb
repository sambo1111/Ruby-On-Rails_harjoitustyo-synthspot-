require 'rails_helper'

RSpec.describe "instrument_setups/show", type: :view do
  before(:each) do
    @instrument_setup = assign(:instrument_setup, InstrumentSetup.create!(
      :name => "Name",
      :info => "MyText",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
