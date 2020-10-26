Rails.application.routes.draw do
  resources :babies
  resources :teams
  resources :parents
  resources :baby_names
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
