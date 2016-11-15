Rails.application.routes.draw do
  root 'home#index'
  
  # Rotas usuários
  resources :usuarios
    get '/usuarios/cadastro/doador' => 'usuarios#doador'
    get '/usuarios/cadastro/empresadoadora' => 'usuarios#empresadoadora'
    post '/usuarios/update_cidades' => 'usuarios#update_cidades'

  # Rotas login
  resources :login
    post '/login/auth' => 'login#auth'
  
  get 'login/login'
  get 'home/index'
  get 'about/about'
  get 'home/selectusertype'
  get 'contato/contato'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
