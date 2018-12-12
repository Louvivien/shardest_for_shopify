Rails.application.routes.draw do
  resources :posts
  #get 'accounts/home'
  #root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  #root :to => 'app_proxy#index'
  get '/' => 'accounts#home'
  get '/update' => 'accounts#update'
  get '/profile' => 'accounts#show'
  get '/demo' => 'accounts#demo4'

    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
