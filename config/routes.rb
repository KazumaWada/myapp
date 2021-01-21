Rails.application.routes.draw do
  # devise_for :users
  get 'sessions/new'
  root 'pages#home'
  # resources :pages
  # resources :pages, only: [:index]
  get  '/about',  to: 'pages#about'
  get  '/signup',  to: 'users#new' #signup=新規
  get    '/login',   to: 'sessions#new'#ログインのフォーム
  post   '/login',   to: 'sessions#create'#postリクエストで実際にログイン
  delete '/logout',  to: 'sessions#destroy'#ログアウト
  resources :users
  resources :account_activations, only: [:edit]
  
  #/posts/1/comment/とかになる。
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end


#_follow_formのrender follow,unfollow用
  resources :relationships,       only: [:create, :destroy]

  #役に立ったボタン。
  post   '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  # get 'favorites/index'




# ゲストログイン
#resources :smooth_login_session, only: :create
resources :testsessions, only: :create
  #memberで、users/1/followingが実現できる。https://pikawaka.com/rails/resources#ネストの定義の仕方
  resources :users do
    member do 
      get :following, :followers
    end
  end
end
