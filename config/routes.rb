Rails.application.routes.draw do
  # resources :telemedics
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
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  post '/logout',  to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#new'
  get '/dashboard/telemedics', to: 'dashboard#viewTelemedic'
  get '/dashboard/addTelemedic', to: 'dashboard#addTelemedic'
  get '/dashboard/updateTelemedic', to: 'dashboard#updateViewTelemedic'
  post '/dashboard/updateTelemedic', to: 'dashboard#updateTelemedic'
  post '/telemedics', to: 'dashboard#createTelemedic'
  resources :users
end
