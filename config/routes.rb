Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show, :create, :update, :destroy]
      get '/meals', to: 'meals#index'
      get '/meals/:meal_id/foods', to: 'meals#show'
      post '/meals/:meal_id/foods/:id', to: 'meal_foods#create'
      delete '/meals/:meal_id/foods/:id', to: 'meal_foods#destroy'
    end
  end

end
