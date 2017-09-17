Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :fellowships do
    member do
      get :reporting_form
      post :report
      post :sign_up
      delete :drop
    end
  end

  resources :service_projects do
    member do
      get :reporting_form
      post :report
      post :sign_up
      delete :drop
    end
  end

  resources :pledge_classes
  resources :lineages
end
