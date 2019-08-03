Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  
  resources :users, only: [:new, :create, :show]
  resources :businesses
  resource :strategic_goals, only: [:new, :create, :show]
  resource :projects, only: [:new, :create, :show]
  resource :resources, only: [:new, :create, :show]


  get '/signin' => 'session#new'
  post '/signin' => 'session#create'
  get '/logout' => 'session#destroy'
  post '/rides' => 'business#create'
end
