Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meeting_rooms do
    collection do
      get 'search'
    end
  end
  resources :bookings
end
