Rails.application.routes.draw do

  devise_for :users
  resources :tweets
  root 'tweets#index'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
