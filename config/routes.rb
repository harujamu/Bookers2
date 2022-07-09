Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as:'about'
  
  devise_for :users
 
  resources:users, only:[:new,:index, :show, :create, :edit]
  resources:books, only:[:index, :show, :edit, :destroy, :create, :new]
 
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
