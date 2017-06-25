class ObjetosController < ApplicationController
  before_action :set_objeto, only: [:show, :edit, :update, :destroy]

  # GET /objetos
  def index
    @objetos = Objeto.all
    @imagem
  end

  # GET /objetos/1
  def show
  end

  # GET /objetos/new
  def new
    @objeto = Objeto.new
    @categorias = CategoriaObjeto.all.order(:nome).map { |categoria| [categoria.nome, categoria.id]}.prepend(['Selecione uma categoria', 0])
  end
  
  # GET /objetos/1/edit
  def edit
    @categorias = CategoriaObjeto.all.order(:nome).map { |categoria| [categoria.nome, categoria.id]}.prepend(['Selecione uma categoria', 0])
  end

  # POST /objetos
  def create
    #teste#
    #if Instituicao.find(session[:instLogedin]) == nil
    #  Instituicao.find(session[:instLogedin]) = Instituicao.all.first
    #end
    #teste#
    
    @objeto = Objeto.new(objeto_params)
    @categorias = CategoriaObjeto.all.order(:nome).map { |categoria| [categoria.nome, categoria.id]}.prepend(['Selecione uma categoria', 0])
   
    if(session[:instLogedin])
      @objeto.instituicao_id = Instituicao.find(session[:instLogedin]).id
    else
      @objeto.instituicao_id = 0 
    end
  
    respond_to do |format|
      if @objeto.save
        format.html { render :success, :locals => {:e => 0} }
        # format.html { redirect_to @objeto, notice: 'Objeto was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def success
    @imagem
  end

  # PATCH/PUT /objetos/1
  # PATCH/PUT /objetos/1.json
  def update
    @categorias = CategoriaObjeto.all.order(:nome).map { |categoria| [categoria.nome, categoria.id]}.prepend(['Selecione uma categoria', 0])
    respond_to do |format|
      if @objeto.update(objeto_params)
        format.html { render :success, :locals => {:e => 1} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /objetos/1
  # DELETE /objetos/1.json
  def destroy
    @instID = @objeto.instituicao_id.to_s
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to '/instituicaos/listObjetos/' + @instID }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objeto
      @objeto = Objeto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objeto_params
      params.require(:objeto).permit(:categoria_objeto_id, :nome, :unidade_medida, :meta, :observacoes)
    end
end
