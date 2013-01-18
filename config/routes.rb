Meal::Application.routes.draw do
  
  devise_for :admins, :controllers => { :sessions => :sessions }	
  resources :admins
  resources :subscription_types
  resources :subscriptions
  resources :holidays

  devise_for :users, :controllers => { :sessions => :sessions }
  resources :users
  resources :transfers do
    member do
      put :update_payment_status
    end
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  match '/home' => "users#show"
end
