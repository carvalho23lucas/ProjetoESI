class Estado < ApplicationRecord
    has_many :cidade, class_name: "Cidade"
    
    validates_presence_of :nome
    validates_presence_of :sigla
end
