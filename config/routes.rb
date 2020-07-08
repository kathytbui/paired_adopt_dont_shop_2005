Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/pets', to: 'shelters#pet_index'
  get '/shelters/:id/pets/new', to:'pets#new'
  post '/shelters/:id/pets', to:'pets#create'
  delete '/shelters/:id', to: 'shelters#destroy'
  patch '/shelters/:id', to: 'shelters#update'


  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/shelters/:id/reviews/new', to: 'reviews#new'
  post '/shelters/:id', to: 'reviews#create'
  get '/shelters/:id/reviews/:id/edit', to: 'reviews#edit'
  patch '/shelters/:id', to: 'reviews#update'
end
