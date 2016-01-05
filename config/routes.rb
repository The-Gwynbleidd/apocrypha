Rails.application.routes.draw do

  # Categories #
  resources :categories
  
  # Root page #
  root "categories#index"

end
