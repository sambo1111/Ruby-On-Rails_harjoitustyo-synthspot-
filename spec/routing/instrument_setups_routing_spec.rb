require "rails_helper"

RSpec.describe InstrumentSetupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/instrument_setups").to route_to("instrument_setups#index")
    end

    it "routes to #new" do
      expect(:get => "/instrument_setups/new").to route_to("instrument_setups#new")
    end

    it "routes to #show" do
      expect(:get => "/instrument_setups/1").to route_to("instrument_setups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/instrument_setups/1/edit").to route_to("instrument_setups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/instrument_setups").to route_to("instrument_setups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/instrument_setups/1").to route_to("instrument_setups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/instrument_setups/1").to route_to("instrument_setups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/instrument_setups/1").to route_to("instrument_setups#destroy", :id => "1")
    end

  end
end
