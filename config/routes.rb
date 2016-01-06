Rails.application.routes.draw do


  # Static Pages #
  get 'index' =>'static_pages#index'
  get 'about' => 'static_pages#about'

  # Users #
  devise_for :users

  # Categories #
  resources :categories, only:[:index, :show, :edit, :update]

  # Admin #
  namespace :admin do
    root "application#index"
    resources :categories
  end

  # Website root page #
  root "static_pages#index"

end
