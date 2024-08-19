Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  resources :prototypes do
    resources :comments, only: :create
end
    resources :users, only: :show
  
end

# collection do get ''end
#userは親子ネストにしなくて良いのかも
