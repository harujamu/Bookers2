Rails.application.routes.draw do
  root to: "home#top"
  get 'home/about' => 'home#about', as:'about'
  
  devise_for :users
 
  resources:users, only:[:new,:index, :show, :create, :edit, :update]
  resources:books, only:[:index, :show, :edit, :create, :new, :update]
  delete 'books/:id' => 'books#destroy', as:'destroy_book'
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
