Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  namespace :admin do 
    root "events#index"
  end

  resource :users, only: [:show, :edit, :update]
end
