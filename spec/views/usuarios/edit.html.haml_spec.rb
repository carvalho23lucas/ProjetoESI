require 'rails_helper'

RSpec.describe "usuarios/edit", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :documento => "MyString",
      :nome => "MyString",
      :email => "MyString",
      :senha => "MyString",
      :cidade => Cidade.new(:nome =>"Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo")),
      :isPJ => false,
      :isInstituicao => false
    ))
  end

  it "renders the edit usuario form" do
    render

    assert_select "form[action=?][method=?]", usuario_path(@usuario), "post" do

      assert_select "input#usuario_documento[name=?]", "usuario[documento]"

      assert_select "input#usuario_nome[name=?]", "usuario[nome]"

      assert_select "input#usuario_email[name=?]", "usuario[email]"

      assert_select "input#usuario_senha[name=?]", "usuario[senha]"

      assert_select "input#usuario_cidade[name=?]", "usuario[cidade]"

      assert_select "input#usuario_isPJ[name=?]", "usuario[isPJ]"

      assert_select "input#usuario_isInstituicao[name=?]", "usuario[isInstituicao]"
    end
  end
end
