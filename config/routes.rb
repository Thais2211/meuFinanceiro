Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post '/login', to: 'users#login'
    resources :users
    resources :categories
  end
end
