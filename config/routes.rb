Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes
  resources :contractors
  resources :tasks
  resources :projects
  resources :users

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
