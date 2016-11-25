require 'rails_helper'

RSpec.describe "objetos/edit", type: :view do
  before(:each) do
    @objeto = assign(:objeto, Objeto.create!(
      :categoria_objetos => nil,
      :nome => "MyString",
      :unidade_medida => "MyString",
      :meta => 1,
      :observacoes => "MyString"
    ))
  end

  it "renders the edit objeto form" do
    render

    assert_select "form[action=?][method=?]", objeto_path(@objeto), "post" do

      assert_select "input#objeto_categoria_objetos_id[name=?]", "objeto[categoria_objetos_id]"

      assert_select "input#objeto_nome[name=?]", "objeto[nome]"

      assert_select "input#objeto_unidade_medida[name=?]", "objeto[unidade_medida]"

      assert_select "input#objeto_meta[name=?]", "objeto[meta]"

      assert_select "input#objeto_observacoes[name=?]", "objeto[observacoes]"
    end
  end
end
