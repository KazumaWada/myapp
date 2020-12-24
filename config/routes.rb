Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  # vueとrailsの連携
  # get '/', to: 'pages#home'
  # get '/post', to: 'pages#home'

end
