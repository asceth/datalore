Datalore::Application.routes.draw do
  resources :reports do
    resources :joins
    resources :fields

    resources :templates do
      resources :template_fields
    end
  end

  resources :meta_columns, :only => [:index]

  root :to => 'reports#index'
end
