class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @estados = Estado.all.order(:nome).map { |estado| [estado.sigla, estado.id]}.prepend(['Selecione um estado', 0])
    @cidades = Cidade.where(:estado_id => 0).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade', 0])
  end

  # GET /usuarios/cadastro/doador
  def doador
    @usuario = Usuario.new
    @estados = Estado.all.order(:nome).map { |estado| [estado.sigla, estado.id]}.prepend(['Selecione um estado', 0])
    @cidades = Cidade.where(:estado_id => 0).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade', 0])
    render 'usuarios/new'
  end

  # GET /usuarios/cadastro/empresadoadora
  def empresadoadora
    @usuario = Usuario.new(:isPJ => true)
    @estados = Estado.all.order(:nome).map { |estado| [estado.sigla, estado.id]}.prepend(['Selecione um estado.', 0])
    @cidades = Cidade.where(:estado_id => 0).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade.', 0])
    render 'usuarios/new'
  end

  # GET /usuarios/1/edit
  def edit
    @estados = Estado.all.order(:nome).map { |estado| [estado.sigla, estado.id]}.prepend(['Selecione um estado.', 0])
    @cidades = Cidade.where(:estado_id => @usuario.cidade.estado.id).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade.', 0])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuário cadastrado.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Dados do usuário atualizados.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_cidades
    @cidades = Cidade.where(:estado_id => params[:estado_id]).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade', 0])
    render partial: "cidades", locals: {cidades: @cidades}
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario deletado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:documento, :nome, :email, :senha, :cidade_id, :isPJ, :isInstituicao)
    end
end
