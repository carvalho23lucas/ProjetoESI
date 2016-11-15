require 'rails_helper'

RSpec.describe "instituicaos/edit", type: :view do
  before(:each) do
    @instituicao = assign(:instituicao, Instituicao.create!(
      #:area_atuacao => nil,
      :documento => "MyString",
      :nome => "MyString",
      :email => "MyString",
      :senha => "MyString",
      :codigo => "MyString",
      :cidade => nil
    ))
  end

  it "renders the edit instituicao form" do
    render

    assert_select "form[action=?][method=?]", instituicao_path(@instituicao), "post" do

      assert_select "input#instituicao_area_atuacao_id[name=?]", "instituicao[area_atuacao_id]"

      assert_select "input#instituicao_documento[name=?]", "instituicao[documento]"

      assert_select "input#instituicao_nome[name=?]", "instituicao[nome]"

      assert_select "input#instituicao_email[name=?]", "instituicao[email]"

      assert_select "input#instituicao_senha[name=?]", "instituicao[senha]"

      assert_select "input#instituicao_codigo[name=?]", "instituicao[codigo]"

      assert_select "input#instituicao_cidade_id[name=?]", "instituicao[cidade_id]"
    end
  end
end
