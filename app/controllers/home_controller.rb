class HomeController < ApplicationController
  def index
    @welcome = 'Fora Temer'
  end
  
  def search
    @objetos = Objeto.where("UPPER(nome) LIKE UPPER(?) ", "%#{params[:query]}%")
    render "objetos/index"
  end
end
