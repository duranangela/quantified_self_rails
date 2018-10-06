Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show, :create, :update, :destroy]
      get '/meals', to: 'meals#index'
    end
  end

end
