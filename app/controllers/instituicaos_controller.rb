class InstituicaosController < ApplicationController
  before_action :set_instituicao, only: [:show, :edit, :update, :destroy]

  # GET /instituicaos
  def index
    if(params.has_key?(:query))
      @instituicaos = Instituicao.where("area_atuacao_id in (?)", AreaAtuacao.where("UPPER(nome) like UPPER(?)","%#{params[:query]}%").ids)
    else
      @instituicaos = Instituicao.all
    end
  end

  # GET /instituicaos/details
  def details
  end

  # GET /instituicaos/1
  def show
  end
  
  # GET instituicaos/listObjetos/1
  def listObjetos
    @instituicao = Instituicao.find(params[:id])
    @objetos = Objeto.where(:instituicao_id => params[:id])
  end

  def logoff
      session[:isLogedIn] = false
      session[:userLogedIn] = nil
      session[:isInstituicao] = false
      session[:instLogedin] = nil
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
      if(Instituicao.exists?(email: @instituicao.email) || Usuario.exists?(email:  @instituicao.email))
        flash.now[:alert]="E-mail já cadastrado"
        new
        format.html { render 'instituicaos/new'}
      else
        if(Instituicao.exists?(documento: @instituicao.documento))
          flash.now[:alert]="CNPJ já cadastrado"
          new
          format.html { render 'instituicaos/new'}
        else
          if @instituicao.save
            session[:isLogedIn] = true
            session[:isInstituicao] = true
            session[:instLogedin] = @instituicao.id
            format.html { redirect_to '/home/home', notice: 'Cadastro realizado com sucesso!' }
          else
            format.html { render :new }
          end
        end
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
      if(params.has_key?(:id) && params[:id] != "details")
        @instituicao = Instituicao.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instituicao_params
      params.require(:instituicao).permit(:area_atuacao_id, :documento, :nome, :email, :senha, :codigo, :cidade_id)
    end
end
