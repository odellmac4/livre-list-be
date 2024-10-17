Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/auth/:provider' => 'sessions#omniauth', as: :auth_login
  get '/auth/:provider/callback' => 'sessions#omniauth', as: :auth_callback
  # get '/auth/:provider' => 'sessions#login', as: :auth_login
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
      
      resources :users do
        resources :bookshelves, only: [:index, :show] do
          resources :books, to: "bookshelf_books#index", only: [:index]
        end
      end
    end
  end
end
