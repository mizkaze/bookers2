Rails.application.routes.draw do

  devise_for :users
  # =deviseを使用するときURLに「users」を含む

  root to: "homes#top"

  resources :books
  resources :users, only: [:index, :show, :edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
