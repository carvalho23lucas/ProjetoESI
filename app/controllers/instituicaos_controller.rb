class InstituicaosController < ApplicationController
  before_action :set_instituicao, only: [:show, :edit, :update, :destroy]

  # GET /instituicaos
  def index
    @instituicaos = Instituicao.all
  end

  # GET /instituicaos/1
  def show
  end

  def logoff
      $isLogedIn = false
      $userLogedIn = nil
      $isInstituicao = false
      $instLogedin = nil
      redirect_to "/home/index"
  end

  # GET /instituicaos/new
  def new
    @instituicao = Instituicao.new
    @areas_atuacao = get_lista_areas_atuacao
    @estados = get_lista_estados
    @cidades = get_lista_cidades(0)
  end

  # GET /instituicaos/1/edit
  def edit
    @areas_atuacao = get_lista_areas_atuacao
    @estados = get_lista_estados
    @cidades = get_lista_cidades(@instituicao.cidade.estado.id)
  end

  # POST /instituicaos
  def create
    @instituicao = Instituicao.new(instituicao_params)
    @areas_atuacao = get_lista_areas_atuacao
    @estados = get_lista_estados
    @cidades = get_lista_cidades(@instituicao.cidade.estado.id)

    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to @instituicao, notice: 'Instituição cadastrada.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /instituicaos/1
  def update
    respond_to do |format|
      if @instituicao.update(instituicao_params)
        format.html { redirect_to @instituicao, notice: 'Instituicao was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def update_cidades
    @cidades = get_lista_cidades(params[:estado_id] == '' ? 0 : params[:estado_id])
    @areas_atuacao = get_lista_areas_atuacao
    render partial: "/cidades", locals: {cidades: @cidades}
  end

  # DELETE /instituicaos/1
  def destroy
    @instituicao.destroy
    respond_to do |format|
      format.html { redirect_to instituicaos_url, notice: 'Instituicao was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituicao
      if $isLogedIn
        @instituicao = $instLogedin
      else
        @instituicao = Instituicao.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instituicao_params
      params.require(:instituicao).permit(:area_atuacao_id, :documento, :nome, :email, :senha, :codigo, :cidade_id)
    end
end
