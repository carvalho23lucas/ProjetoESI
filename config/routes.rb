Rails.application.routes.draw do
  get 'login/login'
  post 'login/login'

  resources :usuarios
  get 'home/index'
  get 'cadastro/cadastrousuariodoador'
  get 'cadastro/cadastrodoador'
  get 'about/about'
  get 'home/selectusertype'
  get 'login/login'
  
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
