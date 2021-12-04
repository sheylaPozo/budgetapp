Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    confirmatios: 'confirmations'
  }, pathname: {
    sign_in: 'login',
    sign_up: 'account',
    sign_out: 'seeyousoon'
  }
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
  
  unauthenticated :user do
    root to: 'splash#index'
  end

  resources :categories, only: [:index, :show, :new, :create]
  resources :treaties, only: [:index, :show, :new, :create]
end
