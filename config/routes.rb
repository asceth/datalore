Datalore::Application.routes.draw do
  resources :reports do
    resources :report_associations
    resources :report_metrics

    resources :templates do
      resources :template_metrics
    end
  end

  resources :meta_columns, :only => [:index]

  root :to => 'reports#index'
end
