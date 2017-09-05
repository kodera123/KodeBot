Rails.application.routes.draw do
  get '/api/callback' => 'bots#callback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
