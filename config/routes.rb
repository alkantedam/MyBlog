Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/alinkamalinka', as: 'rails_admin'
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts
  resources :pictures, only: [:create, :destroy]
end
