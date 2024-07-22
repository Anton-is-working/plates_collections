Rails.application.routes.draw do
  devise_for :admins, as: :auth

  resources :collections, only: %i[show]
  resources :invoices
  root 'collections#index'

  namespace :admin_panel do
    resources :plates
    resources :collections
  end

  devise_for :admins, path: 'api/v1', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
  }, controllers: {
      sessions: 'api/v1/admins/sessions',
      registrations: 'api/v1/admins/registrations'
  }
  
  namespace :api do
    namespace :v1 do
      resources :plates
      resources :collections
    end
  end
end
