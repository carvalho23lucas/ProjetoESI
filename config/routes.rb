Rails.application.routes.draw do
  resources :usuarios
  get 'home/index'
  get 'cadastro/cadastrousuariodoador'
  get 'cadastro/cadastrodoador'
  get 'about/about'
  
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
