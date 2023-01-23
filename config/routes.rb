Rails.application.routes.draw do

 devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }

 devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
 }

 scope module: :public do
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :items, only: [:index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :create]

  patch 'cart_items/destroy_all' => 'cart_items#destroy_all'
  get 'customers/information' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/taikai' => 'customers#taikai'

 end

 namespace :admin do
  resources :genres, only: [:index, :create, :edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
 end

end
