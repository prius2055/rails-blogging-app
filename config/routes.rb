Rails.application.routes.draw do devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only:[:index, :show] do
    resources :posts, only:[:index, :new, :show, :create] do
      resources  :comments, only:[:index, :new, :create]
      resources  :likes, only:[:new, :create]
    end
  end

end
