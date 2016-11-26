require 'rails_helper'

RSpec.describe "objetos/show", type: :view do
  before(:each) do
    @objeto = assign(:objeto, Objeto.create!(
      categoria_objeto: CategoriaObjeto.new(nome: "Alimentos"),
        nome: "Chocolate",
        unidade_medida: "Kilos",
        meta: 10,
        observacoes: "Não"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match("Alimentos")
    expect(rendered).to match("Chocolate")
    expect(rendered).to match("Kilos")
    expect(rendered).to match("10")
    expect(rendered).to match("Não")
  end
end
