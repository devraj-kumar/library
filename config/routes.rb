Rails.application.routes.draw do
  resources :users
  resources :books
  resources :borrowings do
    patch 'return_book', on: :member
  end

  root 'books#index'
end
