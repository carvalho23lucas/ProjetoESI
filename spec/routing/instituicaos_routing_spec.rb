require "rails_helper"

RSpec.describe InstituicaosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/instituicaos").to route_to("instituicaos#index")
    end

    it "routes to #new" do
      expect(:get => "/instituicaos/new").to route_to("instituicaos#new")
    end

    it "routes to #show" do
      expect(:get => "/instituicaos/1").to route_to("instituicaos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/instituicaos/1/edit").to route_to("instituicaos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/instituicaos").to route_to("instituicaos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/instituicaos/1").to route_to("instituicaos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/instituicaos/1").to route_to("instituicaos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/instituicaos/1").to route_to("instituicaos#destroy", :id => "1")
    end

  end
end
