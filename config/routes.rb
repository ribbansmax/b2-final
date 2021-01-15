Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surgeries, only: [:index, :show]
  resources :operations, only: [:create]
  resources :hospitals, only: [:index] do
    scope module: :hospitals do
      resources :surgeries, only: [:index]
    end
  end
end
