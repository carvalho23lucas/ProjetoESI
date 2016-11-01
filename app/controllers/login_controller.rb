class LoginController < ApplicationController
  # POST /login
  # POST /login.json
  def login
    @login = Usuario.new(login_params)

    respond_to do |format|
      format.html { render :login }
      format.json { render json: @login.errors, status: :unprocessable_entity }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @login = Usuario.find(params[:email])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.permit(:email, :senha)
    end
end
