Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#home'
  get 'pages/home'
  get  '/signup',  to: 'users#new' #signup=新規
  get    '/login',   to: 'sessions#new'#ログインのフォーム
  post   '/login',   to: 'sessions#create'#postリクエストで実際にログイン
  delete '/logout',  to: 'sessions#destroy'#ログアウト
  resources :users
  resources :account_activations, only: [:edit]
  #micropostではないので、後からblogPostを編集できるeditが必要。
  resources :posts,          only: [:new, :create, :destroy]
#_follow_formのrender follow,unfollow用
  resources :relationships,       only: [:create, :destroy]

  # 新規ポストlocalhost:3000/posts/new


  #memberで、users/1/followingが実現できる。
  resources :users do
    member do 
      get :following, :followers
    end
  end
end
