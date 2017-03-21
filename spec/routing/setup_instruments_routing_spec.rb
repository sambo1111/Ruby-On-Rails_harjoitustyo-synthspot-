require "rails_helper"

RSpec.describe SetupInstrumentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/setup_instruments").to route_to("setup_instruments#index")
    end

    it "routes to #new" do
      expect(:get => "/setup_instruments/new").to route_to("setup_instruments#new")
    end

    it "routes to #show" do
      expect(:get => "/setup_instruments/1").to route_to("setup_instruments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/setup_instruments/1/edit").to route_to("setup_instruments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/setup_instruments").to route_to("setup_instruments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/setup_instruments/1").to route_to("setup_instruments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/setup_instruments/1").to route_to("setup_instruments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/setup_instruments/1").to route_to("setup_instruments#destroy", :id => "1")
    end

  end
end
