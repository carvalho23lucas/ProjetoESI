require 'rails_helper'

RSpec.describe "Instituicaos", type: :request do
  describe "GET /instituicaos" do
    it "works! (now write some real specs)" do
      get instituicaos_path
      expect(response).to have_http_status(200)
    end
  end
end
