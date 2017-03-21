require 'rails_helper'

RSpec.describe "setup_instruments/new", type: :view do
  before(:each) do
    assign(:setup_instrument, SetupInstrument.new(
      :instrument_setup_id => 1,
      :instrument_id => 1
    ))
  end

  it "renders new setup_instrument form" do
    render

    assert_select "form[action=?][method=?]", setup_instruments_path, "post" do

      assert_select "input#setup_instrument_instrument_setup_id[name=?]", "setup_instrument[instrument_setup_id]"

      assert_select "input#setup_instrument_instrument_id[name=?]", "setup_instrument[instrument_id]"
    end
  end
end
