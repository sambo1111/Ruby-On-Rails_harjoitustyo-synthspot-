require 'rails_helper'

RSpec.describe "InstrumentSetups", type: :request do
  describe "GET /instrument_setups" do
    it "works! (now write some real specs)" do
      get instrument_setups_path
      expect(response).to have_http_status(200)
    end
  end
end
