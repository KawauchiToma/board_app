Rails.application.routes.draw do
  resources :messages,only: [:index,:create] do
    member do
      get :download
    end
  end

  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
