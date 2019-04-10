Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs 
  resources :posts do
    resources :comments, only: [:new]
  end

  resources :comments, only: [:create, :show]
end
