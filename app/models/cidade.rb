class Cidade < ApplicationRecord
  belongs_to :estado
  validates_presence_of :nome
end
