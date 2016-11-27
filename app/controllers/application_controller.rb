class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  # GET /home/index
  def index
     $isLogedIn = false
     $userLogedIn = nil
     $isInstituicao = false
     $instLogedin = nil
  end
end

