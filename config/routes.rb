Rails.application.routes.draw do
  root to: 'searches#new'
  scope do
    resources :searches, only: [:new, :create, :show], param: :term, path: :search
  end
  get '/searches', to: 'searches#index', as: :search_history
end
