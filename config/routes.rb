Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index", as: :main
  
  get '/posts', to: 'posts#index', as:  :main_page
  get '/editor/new', to: 'editor#new', as: :create_post
  get '/editor/cancel', to: 'editor#cancel_edit', as: :cancel_edit
  get '/posts/:id', to: 'posts#show', as: :show_post
  get '/editor/:id', to: 'editor#edit', as: :edit_post
  get '/login', to: 'login#load', as: :log_in
  get '/signin', to: 'signin#load', as: :sign_in


  post '/posts/logout', to: 'login#logout', as: :log_out
  post "/posts/:id", to: 'posts#new_comment', as: :send_comment
 
  post  '/editor/new', to: 'editor#save', as: :post_save
  patch '/editor/:id', to: 'editor#update', as: :post_update
  

  post '/posts', to: 'posts#create'
  post '/signin', to: 'signin#signin'
  post '/login', to: 'login#login'

  delete '/comment/:id', to: 'comments#delete', as: :delete_comment
  delete '/posts/:id', to: 'posts#delete', as: :delete_post


end
