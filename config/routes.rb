Rails.application.routes.draw do
  root 'lessons#index'
  
  get 'signin' => 'sessions#new'
  delete 'signout' => 'sessions#destroy'

  resources :lessons
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
