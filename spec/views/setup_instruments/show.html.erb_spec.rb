require 'rails_helper'

RSpec.describe "setup_instruments/show", type: :view do
  before(:each) do
    @setup_instrument = assign(:setup_instrument, SetupInstrument.create!(
      :instrument_setup_id => 2,
      :instrument_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
