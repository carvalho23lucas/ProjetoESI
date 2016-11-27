class InstituicaosController < ApplicationController
  before_action :set_instituicao, only: [:show, :edit, :update, :destroy]

  # GET /instituicaos
  # GET /instituicaos.json
  def index
    @instituicaos = Instituicao.all
  end

  # GET /instituicaos/1
  # GET /instituicaos/1.json
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
    @estados = Estado.all.order(:nome).map { |estado| [estado.sigla, estado.id]}.prepend(['Selecione um estado.', 0])
    @cidades = Cidade.all.order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade.', 0])
  end

  # GET /instituicaos/1/edit
  def edit
  end

  # POST /instituicaos
  # POST /instituicaos.json
  def create
    @instituicao = Instituicao.new(instituicao_params)

    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to @instituicao, notice: 'Instituicao was successfully created.' }
        format.json { render :show, status: :created, location: @instituicao }
      else
        format.html { render :new }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituicaos/1
  # PATCH/PUT /instituicaos/1.json
  def update
    respond_to do |format|
      if @instituicao.update(instituicao_params)
        format.html { redirect_to @instituicao, notice: 'Instituicao was successfully updated.' }
        format.json { render :show, status: :ok, location: @instituicao }
      else
        format.html { render :edit }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_cidades
    @cidades = Cidade.where(:estado_id => params[:estado_id]).order(:nome).map { |cidade| [cidade.nome, cidade.id] }.prepend(['Selecione uma cidade', 0])
    render partial: "cidades", locals: {cidades: @cidades}
  end

  # DELETE /instituicaos/1
  # DELETE /instituicaos/1.json
  def destroy
    @instituicao.destroy
    respond_to do |format|
      format.html { redirect_to instituicaos_url, notice: 'Instituicao was successfully destroyed.' }
      format.json { head :no_content }
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
