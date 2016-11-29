class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  # GET /home/index
  def application
     $isLogedIn = false
     $userLogedIn = nil
     $isInstituicao = false
     $instLogedin = nil
  end
  
  def get_lista_areas_atuacao
    return AreaAtuacao.all.order(:nome).map { |area| [area.nome, area.id]}.prepend(['Selecione uma área de atuação', ''])
  end
  
  def get_lista_estados
    return Estado.all.order(:nome).map { |estado| [estado.sigla, estado.id]}.prepend(['Selecione um estado', ''])
  end
  
  def get_lista_cidades(estado_id)
    return Cidade.where(:estado_id => estado_id).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade', ''])
  end
end

