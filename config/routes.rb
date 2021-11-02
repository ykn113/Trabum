Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get 'about' => 'homes#about'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show]
  get 'unsubscribe/' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/' => 'users#withdraw', as: 'withdraw_user'
  put 'withdraw/' => 'users#withdraw'
  
end
