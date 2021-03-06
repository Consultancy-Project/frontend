Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/dashboard', to: 'users#dashboard'
  get '/tweets', to: 'users#tweets'
  get '/news', to: 'users#news'

  get '/auth/:provider/callback', to: 'sessions#create'
  
  get "/logout", to: "sessions#destroy"
end
