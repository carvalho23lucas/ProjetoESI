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
    #if $instLogedin == nil
    #  $instLogedin = Instituicao.all.first
    #end
    #teste#
    
    @objeto = Objeto.new(objeto_params)
    @categorias = CategoriaObjeto.all.order(:nome).map { |categoria| [categoria.nome, categoria.id]}.prepend(['Selecione uma categoria', 0])
    @objeto.instituicao_id = ($instLogedin = nil ? 0 : $instLogedin.id)
  
    respond_to do |format|
      if @objeto.save
        format.html { render :success }
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
        format.html { redirect_to @objeto, notice: 'Objeto was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetos/1
  # DELETE /objetos/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to objetos_url, notice: 'Objeto was successfully destroyed.' }
      format.json { head :no_content }
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
