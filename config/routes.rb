Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home" , to: "home#index"
  get "oxygen", to: "oxygen#index"
  get "beds", to: "beds#index"
  get "remdisivir", to: "remdisivir#index"
  get "telemedics", to: "telemedics#index"
  get "plasma", to: "plasma#index"
  get "other", to: "home#other"
end
