Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"

  root to: "pieces#index"
  resources :pieces do
    resources :transactions, only: %i[new create]
  end

  resources :transactions, only: %i[destroy]
  get "/profile", to: "pages#profile", as: :profile
  patch "/transactions/:id/accept", to: "transactions#accept", as: :accept
  patch "/transactions/:id/reject", to: "transactions#reject", as: :reject
end
