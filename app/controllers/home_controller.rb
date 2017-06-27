class HomeController < ApplicationController
  def index
    @welcome = 'Fora Temer'
  end
  
  def search
    @objetos = Objeto.where("UPPER(nome) LIKE UPPER(?) AND NOT is_inativo", "%#{params[:query]}%")
    render "objetos/index"
  end
  
end
