require 'rails_helper'

RSpec.describe "usuarios/new", type: :view do
  before(:each) do
    cidade = Cidade.new(:nome => "Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo"))
    @estados = [cidade.estado.nome, cidade.estado_id]
    @cidades =  [cidade.nome, cidade.id]
    assign(:usuario, Usuario.new(
      :documento => "MyString",
      :nome => "MyString",
      :email => "MyString",
      :senha => "MyString",
      :cidade => cidade,
      :isPJ => false,
      :isInstituicao => false
    ))
  end

  it "renders new usuario form" do
    render
    assert_select "form[action=?][method=?]", usuarios_path, "post" do
      
      assert_select "input#usuario_documento[name=?]", "usuario[documento]"
      
      assert_select "input#usuario_nome[name=?]", "usuario[nome]"
      
      assert_select "input#usuario_email[name=?]", "usuario[email]"
      
      assert_select "input#usuario_senha[name=?]", "usuario[senha]"
      
      assert_select "select#estado[name=?]", "estado"
      
      assert_select "select#usuario_cidade_id[name=?]", "usuario[cidade_id]"

    end
  end
end
