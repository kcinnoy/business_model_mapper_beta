Rails.application.routes.draw do
  get 'resource_types/new'
  get 'resource_types/create'
  get 'resource_types/destroy'
  get 'resource_types/update'
  get 'resource_type/new'
  get 'resource_type/create'
  get 'resource_type/destroy'
  get 'resource_type/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, :controllers => { registrations: 'registrations'}

  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :businesses
  resources :strategic_goals, only: [:new, :create, :show] do
    resources :projects, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  resources :resources, only: [:new, :create, :show, :edit, :destroy]

  # resources :users, only: [:new, :create, :show]
  # get '/signin' => 'session#new'
  # post '/signin' => 'session#create'
  # get '/logout' => 'session#destroy'
  # post '/rides' => 'business#create'
end
