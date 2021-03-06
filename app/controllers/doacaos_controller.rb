class DoacaosController < ApplicationController
  before_action :set_doacao, only: [:show, :edit, :update, :destroy]

  # GET /doacaos

  def index
    if session[:isInstituicao] 
      @instituicao = Instituicao.find_by(id: session[:instLogedin])
      if params[:status] == 'pendentes'
        @doacaos = Doacao.joins(:objeto).where("objetos.instituicao_id = ? and (status = 0 or status = 1)", @instituicao.id).all
      elsif params[:status] == 'aceitas'
        @doacaos = Doacao.joins(:objeto).where("objetos.instituicao_id = ? and (status = 3)", @instituicao.id).all
      else
        @doacaos = Doacao.joins(:objeto).where("objetos.instituicao_id = ? and (status = 2)", @instituicao.id).all
      end
    else
      @doacaos = nil
    end
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

  def contato
    set_doacao
  end
  
  def conf_contato
    set_doacao
    Doacao.where(:id => @doacao.id).update_all("status = 1")
    respond_to do |format|
      format.html { redirect_to '/doacaos?status=pendentes' }
    end
    #update status = 1
  end
  
  def back_contato
    set_doacao
    
    index
    respond_to do |format|
      format.html { redirect_to '/doacaos?status=pendentes' }
    end
  end
  
  def aprovar
    set_doacao
    index
    if params[:aprovar] == 'sim'
      @newVal = @doacao.objeto.meta - @doacao.quantidade
      Objeto.where(:id => @doacao.objeto.id).update_all("meta = " + (@newVal < 0 ? 0 : @newVal).to_s)
      Doacao.where(:id => @doacao.id).update_all("status = 3")
      #update status = 3
    else
      Doacao.where(:id => @doacao.id).update_all("status = 2")
      #update status = 2
    end
    respond_to do |format|
      format.html { redirect_to '/doacaos?status=pendentes' }
    end
  end
  
  def create
    @doacao = Doacao.new(doacao_params)
    respond_to do |format|
      if @doacao.save
        format.html { render :success }
        # format.html { redirect_to @doacao, notice: 'Doacao was successfully created.' }
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
      params.require(:doacao).permit(:usuario_id, :objeto_id, :quantidade, :observacoes, :status)
    end
end
