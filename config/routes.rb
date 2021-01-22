Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :contractors
  resources :tasks
  resources :projects
  resources :users
  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'

  resources :homes, only: [:new, :index, :create, :show]
  resources :homes do
    resources :projects, only: [:new, :index, :create, :show]
  end

  resources :projects do
    resources :contractors, only: [:new, :index, :create]
  end

  resources :contractors do 
    resources :tasks, only: [:new, :index, :create]
  end

  resources :homes do
    member do
      get :delete 
    end
  end

  resources :contractors do
    member do
      get :delete 
    end
  end

  resources :projects do
    member do
      get :delete 
    end
  end

  resources :tasks do
    member do
      get :delete 
    end
  end

end
