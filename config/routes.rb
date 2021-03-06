Rails.application.routes.draw do

  namespace :admin do
  get 'users/index'
  end

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
    resources :users do
      member do
        patch :archive
      end
    end
  end

  # Website root page #
  root "static_pages#index"

end
