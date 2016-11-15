Rails.application.routes.draw do
  root 'home#index'
  resources :instituicaos
  get '/usuarios/instituicaos/new' => 'instituicaos#index'
  
  # Rotas usuários
  resources :usuarios
    get '/usuarios/cadastro/doador' => 'usuarios#doador'
    get '/usuarios/cadastro/empresadoadora' => 'usuarios#empresadoadora'
    post '/cidades/new/update_cidades' => 'cidades#update_cidades'
  
  # Rotas login
  get 'login/login'
  post 'login/login'

  get 'home/index'
  get 'about/about'
  get 'home/selectusertype'

  get 'contato/contato'

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
