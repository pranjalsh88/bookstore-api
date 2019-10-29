Rails.application.routes.draw do
  resources :add_bio_to_authors
  resources :publishing_houses
  resources :authors
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :github_webhooks, only: :create
end
