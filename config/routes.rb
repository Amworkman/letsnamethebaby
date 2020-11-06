Rails.application.routes.draw do
  resources :parents_baby_names
  resources :babies
  resources :teams
  resources :baby_names

  resources :parents do 
    resources :baby_names
  end

  get 'google', to: redirect('/auth/google_oauth2')
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  
  get 'login', to: "sessions#login"
  post 'login', to: "sessions#create"
  get 'sign_up', to: "sessions#new"
  post 'sign_up', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get '/', to: "sessions#home", as: 'home'
  # get '/:anything', to: "application#wrong_page"
  
  # root to: "home#show"
end
