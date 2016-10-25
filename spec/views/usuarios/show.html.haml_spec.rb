require 'rails_helper'

RSpec.describe "usuarios/show", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :documento => "Documento",
      :nome => "Nome",
      :email => "Email",
      :senha => "Senha",
      :cidade => Cidade.new(:nome =>"Guarulhos", :estado => Estado.new(:sigla => "SP", :nome => "São Paulo")),
      :isPJ => false,
      :isInstituicao => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Documento/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Senha/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Não/)
    expect(rendered).to match(/Não/)
  end
end
