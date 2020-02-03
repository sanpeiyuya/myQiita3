Rails.application.routes.draw do
  get 'tags/show'
  # get 'users/index'
  root 'posts#index'
  get"/users/login"=>"users/login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "posts/:id" => "posts#show"
  resources :posts do
    resources :likes, only:[:create,:destroy]
    resources :comments, only: [:create,:destroy]
  end
  resources :users do
    collection do
      get "login"
      post "log_in"
      post "logout"
    end
    member do
      get "likes"
    end
  end
  resources :tags, only: [:show]
end
