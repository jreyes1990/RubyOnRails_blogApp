Rails.application.routes.draw do
  get "articles/search"

  devise_for :users

  get 'welcome', to: "welcome#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :categories

  root "articles#index"
end
