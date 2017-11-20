Rails.application.routes.draw do
  get 'welcome/index'

  resources :movies do
    resources :comments
    member do
      get 'view'
    end
  end

  resources :users

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
