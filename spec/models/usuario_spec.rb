require 'rails_helper'

RSpec.describe Usuario, type: :model do  
  subject { described_class.new(documento:"01234",nome: "Hellyan",email:"hellyan@esi.com",senha:"1234",cidade: Cidade.new(nome: "São Paulo", estado: Estado.new(sigla: "SP", nome: "São Paulo")),isPJ: false,isInstituicao: false) }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
