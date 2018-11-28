Rails.application.routes.draw do
  resources :likes
  resource :session

  get "signup" => "users#new"
  resources :users
  root "events#index"
  resources :events do
    resources :registrations
  end
end
