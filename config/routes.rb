Rails.application.routes.draw do
  get 'search/search'
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
  get '/smooth' => 'users#smooth', as: 'smooth_edit'



#_follow_formのrender follow,unfollow用
  resources :relationships,       only: [:create, :destroy]

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  

  get '/search' => 'search#search'

  #tag
  get 'posts/hashtag/:name', to:'posts#hashtags'
  resources :tags, only: [:index, :show]


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
