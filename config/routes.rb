Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/edit', to: 'posts#edit'
  patch '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#delete'
  post '/posts', to: 'posts#create'
end
