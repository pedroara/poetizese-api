Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    defaults(format: :json) do
      namespace :v1 do
        resources :categories, only: [:index]
        resources :users
        resources :posts
      end
    end
  end

  post 'api/v1/auth/login', to: 'authentication#login'
end
