#  require 'rails_helper'
#  
#  RSpec.describe "instituicaos/edit", type: :view do
#    before(:each) do
#      cidade = Cidade.new(:nome => "Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo"))
#      area_atuacao = AreaAtuacao.new(:nome => "Orfanato")
#      @estados = [cidade.estado.nome, cidade.estado_id]
#      @cidades = [cidade.nome, cidade.id]
#      @areas_atuacao = [area_atuacao.nome, area_atuacao.id]
#      @instituicao = assign(:instituicao, Instituicao.create!(
##        :documento => "MyString",
#        :nome => "MyString",
#        :email => "MyString",
#        :senha => "MyString",
#        :codigo => "MyString",
#        :area_atuacao => area_atuacao,
#        :cidade => cidade
#      ))
#    end
#  
#    it "renders the edit instituicao form" do
#      render
#  
#      assert_select "form[action=?][method=?]", instituicao_path(@instituicao), "post" do
#  
#        #assert_select "input#instituicao_area_atuacao[name=?]", "instituicao[area_atuacao]"
#  
#        assert_select "input#instituicao_documento[name=?]", "instituicao[documento]"
#  
##        assert_select "input#instituicao_nome[name=?]", "instituicao[nome]"
#  
#        assert_select "input#instituicao_email[name=?]", "instituicao[email]"
#  
#        assert_select "input#instituicao_senha[name=?]", "instituicao[senha]"
#  
#        assert_select "input#instituicao_codigo[name=?]", "instituicao[codigo]"
#  
#        #assert_select "input#instituicao_cidade[name=?]", "instituicao[cidade]"
#      end
#    end
#  end
