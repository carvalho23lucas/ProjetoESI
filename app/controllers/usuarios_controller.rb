class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  def show
    
  end
  
  def logoff
      $isLogedIn = false
      $userLogedIn = nil
      $isInstituicao = false
      $instLogedin = nil
      redirect_to "/home/index"
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @estados = get_lista_estados
    @cidades = get_lista_cidades(0)
  end

  # GET /usuarios/cadastro/doador
  def doador
    new
    render 'usuarios/new'
  end

  # GET /usuarios/cadastro/empresadoadora
  def empresadoadora
    new
    @usuario.isPJ = true
    render 'usuarios/new'
  end

  # GET /usuarios/1/edit
  def edit
    @estados = get_lista_estados
    @cidades = get_lista_cidades(@usuario.cidade.estado.id)
  end

  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuário cadastrado.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Dados do usuário atualizados.' }
      else
        format.html { render :edit }
      end
    end
  end

  def update_cidades
    @cidades = get_lista_cidades(params[:estado_id] == '' ? 0 : params[:estado_id])
    render partial: "/cidades", locals: {cidades: @cidades}
  end

  # DELETE /usuarios/1
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario deletado.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      if $isLogedIn
        @usuario = $userLogedIn
      else
        @usuario = Usuario.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:documento, :nome, :email, :senha, :cidade_id, :isPJ, :isInstituicao)
    end
end
