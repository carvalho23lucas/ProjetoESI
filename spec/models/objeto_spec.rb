require 'rails_helper'

RSpec.describe Objeto, type: :model do
  subject { 
      described_class.new(
          categoria_objeto: CategoriaObjeto.new(nome: "Alimentos"),
          nome: "Pão", 
          unidade_medida: "Kilos", 
          meta: 10, 
          observacoes: "Não"
       )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
end
