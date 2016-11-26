require 'rails_helper'

RSpec.describe "instituicaos/new", type: :view do
  before(:each) do
    cidade = Cidade.new(:nome => "Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo"))
    area_atuacao = AreaAtuacao.new(:nome => "Orfanato")
    @estados = [cidade.estado.nome, cidade.estado_id]
    @cidades = [cidade.nome, cidade.id]
    @areas_atuacao = [area_atuacao.nome, area_atuacao.id]
    assign(:instituicao, Instituicao.new(
      :documento => "MyString",
      :nome => "MyString",
      :email => "MyString",
      :senha => "MyString",
      :codigo => "MyString",
      :area_atuacao => area_atuacao,
      :cidade => cidade
    ))
  end

  it "renders new instituicao form" do
    render

    assert_select "form[action=?][method=?]", instituicaos_path, "post" do

      assert_select "input#instituicao_area_atuacao_id[name=?]", "instituicao[area_atuacao_id]"

      assert_select "input#instituicao_documento[name=?]", "instituicao[documento]"

      assert_select "input#instituicao_nome[name=?]", "instituicao[nome]"

      assert_select "input#instituicao_email[name=?]", "instituicao[email]"

      assert_select "input#instituicao_senha[name=?]", "instituicao[senha]"
      
      assert_select "select#estado[name=?]", "estado"
      
      assert_select "select#instituicao_cidade_id[name=?]", "instituicao[cidade_id]"
    end
  end
end
