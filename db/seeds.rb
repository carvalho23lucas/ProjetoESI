# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'net/http'
require 'json'

module Populate
  def self.states
    JSON.parse File.open(File.join(Rails.root, 'app/assets/javascripts', 'states.json')).read
  end
  
  def self.areas_atuacao
    JSON.parse File.open(File.join(Rails.root, 'app/assets/javascripts', 'areas_atuacao.json')).read
  end

  def self.populate
    areas_atuacao.each do |area_atuacao|
      area_atuacao_obj = AreaAtuacao.new(:nome => area_atuacao["nome"])
      area_atuacao_obj.save
    end
    
    states.each do |state|
      state_obj = Estado.new(:sigla => state["sigla"], :nome => state["nome"])
      state_obj.save

      state["cidades"].each do |city|
        c = Cidade.new
        c.nome = city["nome"]
        c.estado = state_obj
        c.save
      end
    end
  end
end

Populate.populate