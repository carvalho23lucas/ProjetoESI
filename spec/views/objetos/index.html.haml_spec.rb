require 'rails_helper'

RSpec.describe "objetos/index", type: :view do
  before(:each) do
    assign(:objetos, [
      Objeto.create!(
        categoria_objeto: CategoriaObjeto.new(nome: "Alimentos"),
        nome: "Chocolate",
        unidade_medida: "Kilos",
        meta: 10,
        observacoes: "Não"
      ),
      Objeto.create!(
        categoria_objeto: CategoriaObjeto.new(nome: "Bebidas"),
        nome: "51",
        unidade_medida: "Garrafas",
        meta: 10,
        observacoes: "Não"
      )
    ])
  end

  it "renders a list of objetos" do
    render
    assert_select "tr>td", :text => Objeto.all.first.categoria_objeto.nome.to_s, :count => 0
    assert_select "tr>td", :text => Objeto.all.first.nome.to_s, :count => 0
    assert_select "tr>td", :text => Objeto.all.first.unidade_medida.to_s, :count => 0
    assert_select "tr>td", :text => Objeto.all.first.meta.to_s, :count => 0
    assert_select "tr>td", :text => Objeto.all.first.observacoes.to_s, :count => 0
  end
end
