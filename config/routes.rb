Rails.application.routes.draw do

  # Static Pages #
  get 'index' =>'static_pages#index'
  get 'about' => 'static_pages#about'

  # Categories #
  resources :categories

  # Root page #
  root "static_pages#index"

end
