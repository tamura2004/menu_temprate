Rails.application.routes.draw do
  resources :users

  root "menus#index"

  get 'battle/attack'
  get 'battle/escape'

  resources :menus
  resources :items
  resources :pcs
end
