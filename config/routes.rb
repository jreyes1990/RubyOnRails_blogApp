Rails.application.routes.draw do
  get 'contacts/create'
  get "articles/search"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    session: 'users/sessions',
    passwords: 'users/passwords'
  }

  get 'welcome', to: "welcome#index"
  get 'contacto', to: "welcome#contacto"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :categories
  resources :contacts, only: [:create]

  root "articles#index"
end
