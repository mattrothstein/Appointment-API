Rails.application.routes.draw do
  get '/appointments' => 'appointments#index'
  post '/appointments' => 'appointments#create'
  resources :appointments

end
