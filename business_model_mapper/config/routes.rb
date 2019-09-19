Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :businesses
  resources :strategic_goals, only: [:new, :create, :show] do
    resources :projects, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  resources :resources, only: [:new, :create, :show, :edit, :destroy] do
    resources :invoices
  end

  get 'projects/:id/next', to: 'preojects#next'

  get '/most-expensive' => 'resources#expensive'

end
