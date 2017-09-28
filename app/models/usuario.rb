class Usuario < ApplicationRecord
  belongs_to :cidade
  validates_confirmation_of :senha, :msg => "Confirmação de senha não confere com senha digitada."
end
