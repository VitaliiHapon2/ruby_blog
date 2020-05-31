Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index", as: :main
  
  get '/posts', to: 'posts#index', as:  :main_page
  get '/posts/new', to: 'posts#new'
  get '/posts/:id', to: 'posts#show', as: :show_post
  get '/posts/:id/edit', to: 'posts#edit', as: :edit_post
  get '/login', to: 'login#load', as: :log_in
  get '/signin', to: 'signin#load', as: :sign_in


  post '/posts/logout', to: 'login#logout', as: :log_out
  post "/posts/:id", to: 'posts#new_comment', as: :send_comment

  patch '/posts/:id', to: 'posts#update'

  post '/posts', to: 'posts#create'
  post '/signin', to: 'signin#signin'
  post '/login', to: 'login#login'

  delete '/comment/:id', to: 'comments#delete', as: :delete_comment
  delete '/posts/:id', to: 'posts#delete', as: :delete_post


  resources :posts do
    resources :comments
  end


  




end
