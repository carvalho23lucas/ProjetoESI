require 'rails_helper'

RSpec.describe "instituicaos/index", type: :view do
  before(:each) do
    assign(:instituicaos, [
      Instituicao.create!(
        :area_atuacao => nil,
        :documento => "Documento",
        :nome => "Nome",
        :email => "Email",
        :senha => "Senha",
        :codigo => "Codigo",
        :cidade => nil
      ),
      Instituicao.create!(
        :area_atuacao => nil,
        :documento => "Documento",
        :nome => "Nome",
        :email => "Email",
        :senha => "Senha",
        :codigo => "Codigo",
        :cidade => nil
      )
    ])
  end

  it "renders a list of instituicaos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Documento".to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Senha".to_s, :count => 2
    assert_select "tr>td", :text => "Codigo".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
