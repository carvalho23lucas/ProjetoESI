require 'rails_helper'

RSpec.describe "objetos/show", type: :view do
  before(:each) do
    @objeto = assign(:objeto, Objeto.create!(
      :categoria_objetos => nil,
      :nome => "Nome",
      :unidade_medida => "Unidade Medida",
      :meta => 2,
      :observacoes => "Observacoes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Unidade Medida/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Observacoes/)
  end
end
