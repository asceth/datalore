Datalore::Application.routes.draw do
  resources :reports do
    resources :joins
    resources :fields
  end

  root :to => 'reports#index'
end
