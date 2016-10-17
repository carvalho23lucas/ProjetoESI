require 'rails_helper'

RSpec.describe "usuarios/index", type: :view do
  cidade = Cidade.new(:nome =>"Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo"))
  before(:each) do
    assign(:usuarios, [
      Usuario.create!(
        :documento => "Documento",
        :nome => "Nome",
        :email => "Email",
        :senha => "Senha",
        :cidade => cidade,
        :isPJ => false,
        :isInstituicao => true
      ),
      Usuario.create!(
        :documento => "Documento",
        :nome => "Nome",
        :email => "Email",
        :senha => "Senha",
        :cidade => cidade,
        :isPJ => false,
        :isInstituicao => true
      )
    ])
  end

  it "renders a list of usuarios" do
    render
    assert_select "tr>td", :text => "Documento".to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Senha".to_s, :count => 2
    assert_select "tr>td", :text => cidade.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end
