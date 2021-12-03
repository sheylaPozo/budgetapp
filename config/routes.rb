Rails.application.routes.draw do
  devise_for :user

  unauthenticated do
    root "users#home"
  end

  root "groups#index", as: "budgets"

  resources :groups, only: [:new, :show, :create] do
    resources :bugets, only: [:new, :show, :create]
  end
end



