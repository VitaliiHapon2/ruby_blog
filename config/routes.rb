Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index", as: :main
  
  get '/posts', to: 'posts#index', as:  :main_page
  get '/posts/new', to: 'posts#new'
  get '/posts/:id', to: 'posts#show', as: :show_post
  get '/posts/:id/edit', to: 'posts#edit', as: :edit_post
  patch '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#delete', as: :delete_post
  post '/posts', to: 'posts#create'



  
  get '/login', to: 'login#load', as: :log_in
  get '/signin', to: 'signin#load', as: :sign_in

  post '/signin', to: 'signin#signin'
  post '/posts/logout', to: 'login#logout', as: :log_out
  post '/login', to: 'login#login'

end
