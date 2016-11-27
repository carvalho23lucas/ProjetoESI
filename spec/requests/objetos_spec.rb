require 'rails_helper'

RSpec.describe "Objetos", type: :request do
  describe "GET /objetos" do
    it "works! (now write some real specs)" do
      get objetos_path
      expect(response).to have_http_status(200)
    end
  end
end
