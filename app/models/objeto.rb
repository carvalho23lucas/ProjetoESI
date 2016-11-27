class Objeto < ApplicationRecord
  belongs_to :categoria_objeto
  validates :nome, presence: true 
  validates :unidade_medida, presence: true 
  validates :meta, presence: true
end
