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
  
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  post 'orders/create' => 'orders#create'
  resources :orders, only: [:new, :index, :show]
  
  get 'customers/information' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/taikai' => 'customers#taikai'

 end

 namespace :admin do
  get root to: "homes#top"
  resources :genres, only: [:index, :create, :edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
 end

end
