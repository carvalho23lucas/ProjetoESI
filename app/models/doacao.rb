class Doacao < ApplicationRecord
  belongs_to :usuario
  belongs_to :objeto
end
