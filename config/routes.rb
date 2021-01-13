Rails.application.routes.draw do
  # devise_for :users
  get 'sessions/new'
  root 'pages#home'
  # resources :pages, only: [:index]
  get  '/about',  to: 'pages#about'
  get  '/signup',  to: 'users#new' #signup=新規
  get    '/login',   to: 'sessions#new'#ログインのフォーム
  post   '/login',   to: 'sessions#create'#postリクエストで実際にログイン
  delete '/logout',  to: 'sessions#destroy'#ログアウト
  resources :users
  resources :account_activations, only: [:edit]
  #indexを残すのみ。
  resources :posts,          only: [:new, :create, :destroy, :show, :edit, :update]
#_follow_formのrender follow,unfollow用
  resources :relationships,       only: [:create, :destroy]

  resources :comments

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
