Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get  '/signup',  to: 'users#new' #signup=新規
  resources :users
end
