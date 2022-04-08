Rails.application.routes.draw do
  get 'account', to: 'accounts#index', as: 'account'
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[show new create]

  root 'pages#index'
end
