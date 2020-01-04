Rails.application.routes.draw do
  # get 'users/index'
  root 'posts#index'
  get"/users/login"=>"users/login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "posts/:id" => "posts#show"
  resources :posts
  resources :users do
    collection do
      get "login"
      post "log_in"
      post "logout"
    end
  end
end
