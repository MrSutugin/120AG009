Rails.application.routes.draw do
  get 'account', to: 'accounts#index', as: 'account'
  get 'account/company', to: 'accounts#company', as: 'account_company'
  get 'account/ads', to: 'accounts#ads', as: 'account_ads'
  get 'account/favorite', to: 'accounts#favorite', as: 'account_favorite'
  get 'account/conversations', to: 'accounts#conversations', as: 'account_conversations'
  get 'account/journal', to: 'accounts#journal', as: 'account_journal'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[show new create]

  root 'pages#index'
end
