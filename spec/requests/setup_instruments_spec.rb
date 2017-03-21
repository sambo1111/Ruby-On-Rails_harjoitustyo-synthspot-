require 'rails_helper'

RSpec.describe "SetupInstruments", type: :request do
  describe "GET /setup_instruments" do
    it "works! (now write some real specs)" do
      get setup_instruments_path
      expect(response).to have_http_status(200)
    end
  end
end
