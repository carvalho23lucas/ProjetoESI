require 'rails_helper'

RSpec.describe AreaAtuacao, type: :model do
  subject { described_class.new(nome: "Orfanato") }
    
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a name" do
    subject.nome = nil
    expect(subject).to_not be_valid
  end
  
end
