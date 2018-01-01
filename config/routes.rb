Rails.application.routes.draw do
  resources :donations
  resources :tasks
  resources :events
  resources :charities
  resources :user_activity_histories
  root 'events#index'
 	devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  scope "/admin" do
    get '/users/show', to: 'users#show'
    post '/users/savenew', to: 'users#savenew'
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
