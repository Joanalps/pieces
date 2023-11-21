Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"

  root to: "pieces#index"
  resources :pieces, except: :index do
    resources :transactions, only: %i[new create]
  end
  resources :transactions, only: %i[destroy edit update accept reject]
  get "/profile", to: "pages#profile", as: :profile
end
