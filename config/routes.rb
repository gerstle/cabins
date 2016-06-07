Rails.application.routes.draw do
  get 'sessions/new'

  # redirects from fnf.inappropirates.com/cabin
  get 'cabins/details' => 'details#index'
  get 'cabins/map' => 'map#index'

  get 'details' => 'details#index', as: 'details'
  get 'map' => 'map#index', as: 'map'

  get 'home' => 'blog#home', as: 'home'
  get 'rules' => 'blog#rules', as: 'rules'
  get 'faq' => 'blog#faq', as: 'faq'


  get 'users/new', as: 'signup'
  post 'users' => 'users#create'

  get    'login'   => 'sessions#new', as: 'login'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy', as: 'logout'

  get 'admin/index', as: 'admin'

  get 'admin/posts/home' => 'posts#show_home', as: 'admin_home'
  get 'admin/posts/rules' => 'posts#show_rule', as: 'admin_rule'
  get 'admin/posts/faq' => 'posts#show_faq', as: 'admin_faq'

  get 'admin/posts/home/new' => 'posts#new_home', as: 'new_home'
  get 'admin/posts/rules/new' => 'posts#new_rule', as: 'new_rule'
  get 'admin/posts/faq/new' => 'posts#new_faq', as: 'new_faq'

  post 'admin/posts' => 'posts#create', as: 'posts'

  get 'admin/posts/:id' => 'posts#show', as: 'edit_post'
  patch 'admin/posts/:id' => 'posts#update', as: 'post'
  delete 'admin/posts/:id' => 'posts#delete', as: 'delete_post'

  get 'admin/registrations' => 'registrations#index', as: 'registrations'
  get 'users/:id' => 'users#show', as: 'user'
  patch 'users/:id' => 'users#update'

  get 'admin/buildings' => 'buildings#index', as: 'buildings'
  get 'admin/buildings/:id' => 'buildings#show', as: 'building'
  patch 'admin/buildings/:id' => 'buildings#update'

  # post 'accommodations/search' => 'accommodations#search', as: 'accommodation_search'
  get 'accommodations' => 'accommodations#index', as: 'accommodations'
  get 'accommodations/:id' => 'accommodations#show', as: 'accommodation'
  patch 'accommodations/:id' => 'accommodations#update'

  # You can have the root of your site routed with "root"
  root 'blog#home'
end
