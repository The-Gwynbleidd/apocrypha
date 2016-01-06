Rails.application.routes.draw do


  # Static Pages #
  get 'index' =>'static_pages#index'
  get 'about' => 'static_pages#about'

  # Users #
  devise_for :users

  # Categories #
  resources :categories

  # Admin #
  namespace :admin do
    root "application#index"
  end

  # Website root page #
  root "static_pages#index"

end
