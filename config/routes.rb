Rails.application.routes.draw do
  get 'oxygen_dealers/index'
  get 'doctors/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home" , to: "home#index"
  get "tele-doctors" , to: "doctors#index"
  get "oxygen", to: "oxygen#index"
  get "oxygen-dealers", to: "oxygen_dealers#index"
  get "beds", to: "beds#index"
  get "remdisivir", to: "remdisivir#index"
  get "telemedics", to: "telemedics#index"
  get "plasma", to: "plasma#index"
  get "other", to: "home#other"
  get "about-us", to: "home#aboutus"
  get "mission", to: "home#mission"
  get "tele-nutrionists", to: "doctors#nutrionists"
  get "tele-psychologists", to: "doctors#psychologists"
  get "covid-resources", to: "doctors#covidresources"
  
  # Authenticated Pages
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/dashboard', to: 'users#new'
  resources :users
end
