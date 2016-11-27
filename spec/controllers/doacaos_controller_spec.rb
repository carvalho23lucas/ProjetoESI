require 'rails_helper'

RSpec.describe DoacaosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Doacao. As you add validations to Doacao, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DoacaosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all doacaos as @doacaos" do
      doacao = Doacao.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:doacaos)).to eq([doacao])
    end
  end

  describe "GET #show" do
    it "assigns the requested doacao as @doacao" do
      doacao = Doacao.create! valid_attributes
      get :show, params: {id: doacao.to_param}, session: valid_session
      expect(assigns(:doacao)).to eq(doacao)
    end
  end

  describe "GET #new" do
    it "assigns a new doacao as @doacao" do
      get :new, params: {}, session: valid_session
      expect(assigns(:doacao)).to be_a_new(Doacao)
    end
  end

  describe "GET #edit" do
    it "assigns the requested doacao as @doacao" do
      doacao = Doacao.create! valid_attributes
      get :edit, params: {id: doacao.to_param}, session: valid_session
      expect(assigns(:doacao)).to eq(doacao)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Doacao" do
        expect {
          post :create, params: {doacao: valid_attributes}, session: valid_session
        }.to change(Doacao, :count).by(1)
      end

      it "assigns a newly created doacao as @doacao" do
        post :create, params: {doacao: valid_attributes}, session: valid_session
        expect(assigns(:doacao)).to be_a(Doacao)
        expect(assigns(:doacao)).to be_persisted
      end

      it "redirects to the created doacao" do
        post :create, params: {doacao: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Doacao.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved doacao as @doacao" do
        post :create, params: {doacao: invalid_attributes}, session: valid_session
        expect(assigns(:doacao)).to be_a_new(Doacao)
      end

      it "re-renders the 'new' template" do
        post :create, params: {doacao: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested doacao" do
        doacao = Doacao.create! valid_attributes
        put :update, params: {id: doacao.to_param, doacao: new_attributes}, session: valid_session
        doacao.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested doacao as @doacao" do
        doacao = Doacao.create! valid_attributes
        put :update, params: {id: doacao.to_param, doacao: valid_attributes}, session: valid_session
        expect(assigns(:doacao)).to eq(doacao)
      end

      it "redirects to the doacao" do
        doacao = Doacao.create! valid_attributes
        put :update, params: {id: doacao.to_param, doacao: valid_attributes}, session: valid_session
        expect(response).to redirect_to(doacao)
      end
    end

    context "with invalid params" do
      it "assigns the doacao as @doacao" do
        doacao = Doacao.create! valid_attributes
        put :update, params: {id: doacao.to_param, doacao: invalid_attributes}, session: valid_session
        expect(assigns(:doacao)).to eq(doacao)
      end

      it "re-renders the 'edit' template" do
        doacao = Doacao.create! valid_attributes
        put :update, params: {id: doacao.to_param, doacao: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested doacao" do
      doacao = Doacao.create! valid_attributes
      expect {
        delete :destroy, params: {id: doacao.to_param}, session: valid_session
      }.to change(Doacao, :count).by(-1)
    end

    it "redirects to the doacaos list" do
      doacao = Doacao.create! valid_attributes
      delete :destroy, params: {id: doacao.to_param}, session: valid_session
      expect(response).to redirect_to(doacaos_url)
    end
  end

end
