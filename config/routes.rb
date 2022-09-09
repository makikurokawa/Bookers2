Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  get 'users/edit'
  get 'users' => 'users#index'
  get 'users/:id' => 'user#show', as: 'user'

  resources :books, only: [:index, :show, :edit]

  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
