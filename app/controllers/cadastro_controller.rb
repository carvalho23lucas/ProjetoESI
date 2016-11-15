class CadastroController < ApplicationController
 def update_cidades
    @cidades = Cidade.where(:estado_id => params[:estado_id]).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade.', 0])
    render partial: "cidades", locals: {cidades: @cidades}
  end
end
