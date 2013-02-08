Meal::Application.routes.draw do
  
  devise_for :admins, :controllers => { :sessions => :sessions }	
  resources :admins
  resources :subscription_types do
    member do
      get :filter_subscriptions
    end
    collection do
      get :working_days_in_month
    end
  end
  resources :subscriptions do
    collection do
      put :update_payment_status
    end
  end
  resources :holidays

  devise_for :users, :controllers => { :sessions => :sessions }
  resources :users
  resources :transfers do
    member do
      put :update_payment_status
      put :cancel_borrow
    end
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  match '/home' => "users#show"
  match "/admin" => redirect("/admins/signin")
  
end
