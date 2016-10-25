class UsuarioDoadorController < ApplicationController
    before_action :set_usuariodoador
    
     # GET /usuarios/new
    def new
        @usuario = Usuario.new
    end
end