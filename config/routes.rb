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

  get '/reviews', to: 'reviews#index'
  get '/shelters/:id/reviews/new', to: 'reviews#new'
  post '/shelters/:id', to: 'reviews#create'
  get '/reviews/:id/edit', to: 'reviews#edit'
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy'

  get '/favorites', to: 'favorites#index'
  get '/pets/:id/favorites/new', to: 'favorites#new'
  post '/pets/:id/favorites', to: 'favorites#create'
  delete '/favorites/:pet_id', to: 'favorites#destroy'

end
