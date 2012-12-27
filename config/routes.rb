Meal::Application.routes.draw do
  
  devise_for :admins, :controllers => { :sessions => :sessions }	
  resources :admins
  resources :subscription_types
  resources :subscriptions

  devise_for :users, :controllers => { :sessions => :sessions }
  resources :users
  resources :transfers
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
