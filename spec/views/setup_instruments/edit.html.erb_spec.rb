require 'rails_helper'

RSpec.describe "setup_instruments/edit", type: :view do
  before(:each) do
    @setup_instrument = assign(:setup_instrument, SetupInstrument.create!(
      :instrument_setup_id => 1,
      :instrument_id => 1
    ))
  end

  it "renders the edit setup_instrument form" do
    render

    assert_select "form[action=?][method=?]", setup_instrument_path(@setup_instrument), "post" do

      assert_select "input#setup_instrument_instrument_setup_id[name=?]", "setup_instrument[instrument_setup_id]"

      assert_select "input#setup_instrument_instrument_id[name=?]", "setup_instrument[instrument_id]"
    end
  end
end
