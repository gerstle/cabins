Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index', as: 'home'
  get 'users/new', as: 'signup'
  get 'details/index', as: 'details'
  get 'overview/index', as: 'overview'
  get 'rules/index', as: 'rules'

  get    'login'   => 'sessions#new', as: 'login'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy', as: 'logout'

  get 'admin/index', as: 'admin'
  get 'posts/new' => 'posts#new', as: 'new_welcome', :defaults => { :category => 'welcome'}
  get 'admin/posts' => 'posts#index', as: 'admin_welcomes', :defaults => { :category => 'welcome'}
  get 'admin/posts/new' => 'posts#new', as: 'new_rule', :defaults => { :category => 'rule'}
  get 'admin/posts' => 'posts#index', as: 'admin_rules', :defaults => { :category => 'rule'}
  post 'admin/posts' => 'posts#create', as: 'posts'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :users

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
