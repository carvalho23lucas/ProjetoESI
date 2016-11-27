class LoginController < ApplicationController
  # POST /login
  def show
    @login = Usuario.new(login_params)

    respond_to do |format|
      format.html { render :login }
    end
  end
  
  def auth
    user = Usuario.find_by(email: params[:email])
    inst = Instituicao.find_by(email: params[:email])
    if user && user.senha == params[:senha]
      $isLogedIn = true
      $userLogedIn = user
      redirect_to "/home/home"
    elsif inst && inst.senha == params[:senha]
      $isLogedIn = true
      $isInstituicao = true
      $instLogedin = inst
      redirect_to "/home/home"
    else  
      flash.now[:alert] = ''
      render action: 'login'
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.permit(:email, :senha)
    end
end