Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :categories, defaults: { format: :json }
      resources :posts, defaults: { format: :json } do
        resources :comments, defaults: { format: :json }
      end
      resources :users, defaults: { format: :json }
      resource :session, defaults: { format: :json }
    end
  end


  scope module: :web do
    root to: "welcome#index"
  end





end
