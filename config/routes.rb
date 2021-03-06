Rails.application.routes.draw do

  root 'home#index'

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  get 'sign_out' => 'sessions#delete', as: :sign_out

  get 'sign_up' => 'users#new', as: :new_user
  post 'sign_up' => 'users#create', as: :users

  get 'rooms' => 'rooms#index', as: :rooms
  get 'rooms/:name/:id' => 'rooms#show', as: :room
  get 'rooms/new' => 'rooms#new', as: :new_room
  post 'rooms' => 'rooms#create'
  post 'rooms/join/:id' => 'rooms#join_room', as: :join_room
  delete 'rooms/leave/:id' => 'rooms#leave_room', as: :leave_room

  namespace :api do
    post 'users' => 'users#create'
    patch 'users' => 'users#update'
    delete 'users/:id' => 'users#delete'
    get 'me' => 'users#show'

    resources :rooms
    post 'rooms/:id/posts' => 'rooms#add_post'
    delete 'rooms/:id/posts/:id' => 'rooms#delete_post'
    post 'rooms/:id/users' => 'rooms#add_user'
    delete 'rooms/:id/users' => 'rooms#delete_user'
  end

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
