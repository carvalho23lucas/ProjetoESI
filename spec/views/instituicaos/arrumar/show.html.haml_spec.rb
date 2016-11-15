require 'rails_helper'

RSpec.describe "instituicaos/show", type: :view do
  before(:each) do
    @instituicao = assign(:instituicao, Instituicao.create!(
      :area_atuacao => nil,
      :documento => "Documento",
      :nome => "Nome",
      :email => "Email",
      :senha => "Senha",
      :codigo => "Codigo",
      :cidade => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Documento/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Senha/)
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(//)
  end
end
