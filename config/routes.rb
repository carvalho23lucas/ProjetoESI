Rails.application.routes.draw do
  resources :objetos
  root 'home#index'
  resources :instituicaos
  get '/usuarios/instituicaos/new' => 'instituicaos#index'
  
  # Rotas usuários
  resources :usuarios
    post '/usuarios/logoff' => 'usuarios#logoff'
    get '/usuarios/cadastro/doador' => 'usuarios#doador'
    get '/usuarios/cadastro/empresadoadora' => 'usuarios#empresadoadora'
    post '/cidades/new/update_cidades' => 'cidades#update_cidades'
  
    #post '/usuarios/update_cidades' => 'usuarios#update_cidades'

  # Rotas login
  resources :login
    post '/login/auth' => 'login#auth'
  
  resources :layouts
    
    
  get 'login/login'
  get 'home/index'
  get 'home/home'
  get 'home/cadastrousuariodoador'
  get 'about/about'
  get 'home/selectusertype'
  
  post 'home/search' =>'home#search'  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
