Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "cheat_sheets#new"
  resources :cheat_sheets

  get "download", to: "cheat_sheets#download"
end
