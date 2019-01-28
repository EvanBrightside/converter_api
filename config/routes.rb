require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: { format: 'json' } do
    resources :coins, only: :index
    resources :exchanges, only: %w[index create]
  end
end
