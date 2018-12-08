Rails.application.routes.draw do
  #get 'accounts/home'

  mount ShopifyApp::Engine, at: '/'
  get '/auth/oauth2/callback', to: 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  #root :to => 'app_proxy#index'
  root :to => 'auth0#log'
  
 
      
    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
