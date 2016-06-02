Rails.application.routes.draw do
  get 'sessions/new'

  # redirects from fnf.inappropirates.com/cabin
  get 'cabins/overview' => 'overview#index'
  get 'cabins/details' => 'details#index'
  get 'cabins/map' => 'map#index'

  get 'users/new', as: 'signup'
  get 'details/index', as: 'details'
  get 'overview/index', as: 'overview'
  get 'rules/index', as: 'rules'
  get 'map/index', as: 'map'
  get 'blog/index' => 'blog#index', as: 'blog'

  get    'login'   => 'sessions#new', as: 'login'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy', as: 'logout'

  get 'admin/index', as: 'admin'

  get 'admin/posts' => 'posts#index', as: 'admin_posts'
  get 'admin/posts/new' => 'posts#new'
  get 'posts/new' => 'posts#new', as: 'new_post'
  post 'admin/posts' => 'posts#create', as: 'posts'

  get 'admin/posts/:id' => 'posts#show', as: 'edit_post'
  patch 'admin/posts/:id' => 'posts#update', as: 'post'
  delete 'admin/posts/:id' => 'posts#delete', as: 'delete_post'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'blog#index'

  resources :users
end
