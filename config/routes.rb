Datalore::Application.routes.draw do
  resources :reports do
    resources :joins
    resources :fields

    resources :templates do
      resources :template_fields
    end
  end

  root :to => 'reports#index'
end
