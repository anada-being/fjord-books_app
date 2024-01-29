Rails.application.routes.draw do
  get 'users/list'
  get 'users/show'
  patch 'users/edit'
  devise_for :users
  resources :books, :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
