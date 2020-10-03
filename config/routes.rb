Rails.application.routes.draw do
  resources :master_stitches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "cheat_sheets#index"
  resources :cheat_sheets
  resources :master_stitches, only: [:new, :create, :edit, :update]

  get "download", to: "cheat_sheets#download"
end
