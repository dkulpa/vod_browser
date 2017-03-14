Rails.application.routes.draw do
  root 'searches#new'
  resources :searches
  resources :movies do
    collection do
      get 'cineman'
    end
  end
end
