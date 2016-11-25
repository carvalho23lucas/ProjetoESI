require 'rails_helper'

RSpec.describe "objetos/index", type: :view do
  before(:each) do
    assign(:objetos, [
      Objeto.create!(
        :categoria_objetos => nil,
        :nome => "Nome",
        :unidade_medida => "Unidade Medida",
        :meta => 2,
        :observacoes => "Observacoes"
      ),
      Objeto.create!(
        :categoria_objetos => nil,
        :nome => "Nome",
        :unidade_medida => "Unidade Medida",
        :meta => 2,
        :observacoes => "Observacoes"
      )
    ])
  end

  it "renders a list of objetos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Unidade Medida".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Observacoes".to_s, :count => 2
  end
end
