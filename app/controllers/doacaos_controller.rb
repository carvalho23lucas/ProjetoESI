class DoacaosController < ApplicationController
  before_action :set_doacao, only: [:show, :edit, :update, :destroy]

  # GET /doacaos

  def index
    @doacaos = Doacao.all
  end

  # GET /doacaos/1
  
  #def show
  #end

  # GET /doacaos/new
  def new
    @doacao = Doacao.new
    @objeto = Objeto.new
  end

  # GET /doacaos/1/edit
  def edit
  end

  # POST /doacaos

  def create
    @usuario = $userLogedIn
    @objeto = Objeto.new
    @quantidade = 0
    @observacoes = ""
    @doacao = Doacao.new(:usuario=>@usuario,:objeto=>@objeto,:quantidade=>@quantidade,:observacoes=>@observacoes)
    respond_to do |format|
      if @doacao.save
        format.html { redirect_to @doacao, notice: 'Doacao was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /doacaos/1
  # PATCH/PUT /doacaos/1.json
  def update
    respond_to do |format|
      if @doacao.update(doacao_params)
        format.html { redirect_to @doacao, notice: 'Doacao was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /doacaos/1
  # DELETE /doacaos/1.json
  def destroy
    @doacao.destroy
    respond_to do |format|
      format.html { redirect_to doacaos_url, notice: 'Doacao was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doacao
      @doacao = Doacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doacao_params
      params.require(:doacao).permit(:usuario_id, :objeto_id, :quantidade, :observacoes)
    end
end