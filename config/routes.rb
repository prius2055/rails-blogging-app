Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only:[:index, :show] do
    resources :posts, only:[:index, :show]
  end

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'

  # get '/users/:id/posts', to: 'posts#show'
  # get '/users/:id/posts/:id', to: 'posts#show'

end
