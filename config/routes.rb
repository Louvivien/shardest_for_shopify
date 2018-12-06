Rails.application.routes.draw do
  #get 'accounts/home'
  #root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  #get 'auth/oauth2/callback' => 'auth0#callback'
  #get 'auth/failure' => 'auth0#failure'

  namespace :app_proxy do
    root :to => 'app_proxy#index'

    resources :accounts
      get '/accounts' => 'accounts#home'
      
    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
