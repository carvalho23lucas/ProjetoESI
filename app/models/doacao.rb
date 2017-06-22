class Doacao < ApplicationRecord
  belongs_to :usuario
  belongs_to :objeto
  #status
  # 0 - pendente contato
  # 1 - pendente aprovação (apos contato)
  # 2 - cancelado
  # 3 - aprovado
end
