Rails.application.routes.draw do
  get 'feed/index'

#  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
#  get 'cats/index'

#  get 'cats/new'

  root 'staticpages#home'
	post 'notif' => 'staticpages#notif'
	get 'json' => 'staticpages#json'
	#post 'login' => 'sessions#create'
	#delete 'logout' => 'sessions#destroy'
#	get 'newpost'  => 'posts#new'
#	post 'newpost' => 'posts#create'
	get 'cats' => 'cats#index'
	post 'cats' => 'cats#create'
  get 't5efeed' => 'feed#index' 
#	get 'posts' => 'posts#show'
#	post 'comments' => 'comments#create'
#	post 'posted' => 'posts#create'
  #get "/fetch_post" => 'staticpages#ajaxposts', as: 'fetch_post'
	resources :posts 
#	resources :comments
  resources :oauth
	get 'feeds/:id' => 'tags#show'
#	match '/:id', :to => "tags#show", :as => :category, :via => :get 
# one can use category name as param
	get 'login'=> 'oauth#index'
  delete 'logout'=>'oauth#signout'
#  post 'login'=> 'sessions#create'
#  delete 'logout'=>'sessions#destroy'
  get  'search'=> 'posts#search'
#	resources :cats
#	resources :comments
 # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end