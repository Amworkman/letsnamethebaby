Rails.application.routes.draw do
  resources :parents_baby_names
  resources :babies
  resources :teams
  resources :baby_names

  resources :parents do 
    resources :baby_names
  end
  
  get '/', to: "teams#home"
  get '/sign_in', to: "teams#sign_in"
  get'/sign_up', to: "teams#sign_up"
end
