Rails.application.routes.draw do
 
  #トップページ
  root to: 'tops#index'
  
  #ログイン処理
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  #別途URL指定
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #アカウント作成
  #別途URL指定
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :destroy]
  
  #検索結果
  resources :results, only:[:create, :destroy]
  
  #問い合わせ機能
  get 'contacts/new', to: 'contacts#new'        #入力画面
  post 'contacts/new', to: 'contacts#create'    #送信完了
 
end
