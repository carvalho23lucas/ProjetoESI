require 'rails_helper'

RSpec.describe "instituicaos/index", type: :view do
  before(:each) do
    assign(:instituicaos, [
      Instituicao.create!(
        :documento => "Documento",
        :nome => "Nome",
        :email => "Email",
        :senha => "Senha",
        :codigo => "Codigo",
        :area_atuacao => AreaAtuacao.new(:nome => "Orfanato"),
        :cidade => Cidade.new(:nome => "Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo"))
      ),
      Instituicao.create!(
        :documento => "Documento",
        :nome => "Nome",
        :email => "Email",
        :senha => "Senha",
        :codigo => "Codigo",
        :area_atuacao => AreaAtuacao.new(:nome => "Orfanato"),
        :cidade => Cidade.new(:nome => "Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo"))
      )
    ])
  end

  it "renders a list of instituicaos" do
    render
    #assert_select "tr>td", :text => "#<AreaAtuacao:0x00000007197718>".to_s, :count => 2
    assert_select "tr>td", :text => "Documento".to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Senha".to_s, :count => 2
    assert_select "tr>td", :text => "Codigo".to_s, :count => 2
    #assert_select "tr>td", :text => "#<AreaAtuacao:0x00000007197718>".to_s, :count => 2
  end
end
