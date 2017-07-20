Rails.application.routes.draw do
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

  # post 'service_projects/:id/sign_up', to: 'service_projects#sign_up', as: 'service_project_sign_up'
  # delete 'service_projects/:id/drop', to: 'service_projects#drop', as: 'service_project_drop'
  # get 'service_projects/:id/reporting_form', to: 'service_projects#reporting_form', as: 'service_project_reporting_form'
  # post 'service_projects/:id/report', to: 'service_projects#report', as: 'service_project_report'

  resources :pledge_classes
  resources :lineages
  root 'home#index'
  devise_for :users
end
