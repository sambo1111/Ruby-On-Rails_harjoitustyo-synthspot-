require 'rails_helper'

RSpec.describe "instrument_setups/new", type: :view do
  before(:each) do
    assign(:instrument_setup, InstrumentSetup.new(
      :name => "MyString",
      :info => "MyText",
      :user_id => 1
    ))
  end

  it "renders new instrument_setup form" do
    render

    assert_select "form[action=?][method=?]", instrument_setups_path, "post" do

      assert_select "input#instrument_setup_name[name=?]", "instrument_setup[name]"

      assert_select "textarea#instrument_setup_info[name=?]", "instrument_setup[info]"

      assert_select "input#instrument_setup_user_id[name=?]", "instrument_setup[user_id]"
    end
  end
end
