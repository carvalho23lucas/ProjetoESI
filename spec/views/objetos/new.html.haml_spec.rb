require 'rails_helper'

RSpec.describe "objetos/new", type: :view do
  before(:each) do
    categoria = CategoriaObjeto.new(:nome => "Alimentos")
    #@categorias = CategoriaObjeto.all.order(:nome).map { |categoria| [categoria.nome, categoria.id]}.prepend(['Selecione uma categoria', 0])
    @categorias = [categoria.nome, categoria.id]
    assign(:objeto, Objeto.new(
      :categoria_objeto => categoria,
      :nome => "Chocolate",
      :unidade_medida => "Kilos",
      :meta => 10,
      :observacoes => "Não"
    ))
  end

  it "renders new objeto form" do
    render

    assert_select "form[action=?][method=?]", objetos_path, "post" do

      assert_select "select#objeto_categoria_objeto_id[name=?]", "objeto[categoria_objeto_id]"

      assert_select "input#objeto_nome[name=?]", "objeto[nome]"

      assert_select "input#objeto_unidade_medida[name=?]", "objeto[unidade_medida]"

      assert_select "input#objeto_meta[name=?]", "objeto[meta]"

      assert_select "input#objeto_observacoes[name=?]", "objeto[observacoes]"
    end
  end
end
