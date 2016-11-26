class Instituicao < ApplicationRecord
  belongs_to :area_atuacao
  belongs_to :cidade
end
