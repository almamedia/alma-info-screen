Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :page
  resources :component
  resources :componentdata

  get '/componentdata/:name', to: 'componentdata#show'
  patch '/componentdata', to: 'componentdata#update'

  patch '/component', to: 'component#update'
  delete '/component', to: 'component#destroy'

end
