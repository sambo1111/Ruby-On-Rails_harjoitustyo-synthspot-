require 'rails_helper'

RSpec.describe "instrument_setups/edit", type: :view do
  before(:each) do
    @instrument_setup = assign(:instrument_setup, InstrumentSetup.create!(
      :name => "MyString",
      :info => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit instrument_setup form" do
    render

    assert_select "form[action=?][method=?]", instrument_setup_path(@instrument_setup), "post" do

      assert_select "input#instrument_setup_name[name=?]", "instrument_setup[name]"

      assert_select "textarea#instrument_setup_info[name=?]", "instrument_setup[info]"

      assert_select "input#instrument_setup_user_id[name=?]", "instrument_setup[user_id]"
    end
  end
end
