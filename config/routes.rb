Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root "users#home"
  end

  root "groups#index", as: "budget"

  resources :groups, only: [:new, :show, :create] do
    resources :budgets, only: [:new, :show, :create]
  end
end
