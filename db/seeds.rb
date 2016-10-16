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
  def self.areas_atuacao
    JSON.parse File.open(File.join(Rails.root, 'app/assets/javascripts', 'areas_atuacao.json')).read
  end
  def self.categorias_objeto
    JSON.parse File.open(File.join(Rails.root, 'app/assets/javascripts', 'categorias_objeto.json')).read
  end
  def self.estados_cidades
    JSON.parse File.open(File.join(Rails.root, 'app/assets/javascripts', 'estados_cidades.json')).read
  end



  def self.populate_areas_atuacao
    areas_atuacao.each do |area_atuacao|
      area_atuacao_obj = AreaAtuacao.new(:nome => area_atuacao["nome"])
      area_atuacao_obj.save
    end
  end
    
  def self.populate_categorias_objeto
    categorias_objeto.each do |categoria_objeto|
      categoria_objeto_obj = CategoriaObjeto.new(:nome => categoria_objeto["nome"])
      categoria_objeto_obj.save
    end
  end
    
  def self.populate_estados_cidades
    estados_cidades.each do |estado|
      estado_obj = Estado.new(:sigla => estado["sigla"], :nome => estado["nome"])
      estado_obj.save

      estado["cidades"].each do |cidade|
        cidade_obj = Cidade.new(:nome => cidade["nome"], :estado => estado_obj)
        cidade_obj.save
      end
    end
  end
end

Populate.populate_areas_atuacao
Populate.populate_categorias_objeto
Populate.populate_estados_cidades