require "rails_helper"

RSpec.describe ObjetosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/objetos").to route_to("objetos#index")
    end

    it "routes to #new" do
      expect(:get => "/objetos/new").to route_to("objetos#new")
    end

    it "routes to #show" do
      expect(:get => "/objetos/1").to route_to("objetos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/objetos/1/edit").to route_to("objetos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/objetos").to route_to("objetos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/objetos/1").to route_to("objetos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/objetos/1").to route_to("objetos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/objetos/1").to route_to("objetos#destroy", :id => "1")
    end

  end
end
