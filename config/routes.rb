Rails.application.routes.draw do
  get 'post/create'
  post 'post/store'
  
  root 'home#index'
end
