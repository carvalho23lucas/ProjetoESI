Rails.application.routes.draw do
  resources :objetos
  root 'home#index'
  resources :instituicaos do
    collection do
      get 'details'
    end
  end
  post '/instituicaos/logoff' => 'instituicaos#logoff'
  
  # Rotas usuários
  resources :usuarios
    post '/usuarios/logoff' => 'usuarios#logoff'
    get '/usuarios/cadastro/doador' => 'usuarios#doador'
    get '/usuarios/cadastro/empresadoadora' => 'usuarios#empresadoadora'

  post '/usuarios/update_cidades' => 'usuarios#update_cidades'
  post '/instituicaos/update_cidades' => 'instituicaos#update_cidades'

  # Rotas login
  resources :login
    post '/login/auth' => 'login#auth'
  
  resources :layouts
  
  resources :doacaos  
    get '/doacoes/cadastro' => 'doacaos#new'
    get '/doacaos/:id/contato' => 'doacaos#contato'
    
  get 'login/login'
  get 'home/index'
  get 'home/home'
  get 'home/cadastrousuariodoador'
  get 'about/about'
  get 'home/selectusertype'
  get 'instituicaos/listObjetos/:id' => 'instituicaos#listObjetos'
  
  post 'home/search' =>'home#search'  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
