Rails.application.routes.draw do
  
  root to: "sessions#home";
  get '/sessions/index'=>'sessions#index';
  get '/sessions/home'=>'sessions#home';
  post '/sessions/sign_up'=>'sessions#sign_up';
  post '/sessions/sign_in'=>'sessions#sign_in';
  get '/homes/index'=>'homes#index';
  match '/sessions/destroy'=>'sessions#destroy', :via=>[:get,:post] 
  post '/collections/create/'=>'collections#create';
  post '/notes/create/'=>'notes#create';
  get '/notes/new/:collection_id' => 'notes#new';
  post '/notes/update/' => 'notes#update';
  get '/notes/destroy/:note_id/:collection_id' => 'notes#destroy';
  get '/collections/all/' => 'collections#all';
  get '/collections/destroy/:collection_id' => 'collections#destroy';
  get '/groups/new/' => 'groups#new';
  post '/groups/create/' => 'groups#create';
  get '/groups/view/:group_id' => 'groups#view';
  get '/groups/select/:group_id' => 'groups#select';
  get '/saves/select/:group_id' => 'saves#select';
  get '/groups/all/' => 'groups#all';
  post '/groupnotes/create/' => 'group_notes#create'
  post '/groupnotes/delete/' => 'group_notes#delete';
  get '/notes/retrieve/:notes_id' => 'notes#retrieve';
  get '/groups/delete/:group_id/:user_id' => 'groups#delete';
  post '/tags/share/' => 'tags#share';
  get '/tags/unshare/:collection_id' => 'tags#unshare';  
  get '/tags/add' =>"tags#add";
  get '/tags/remove'=>"tags#remove";
  get '/saves/all'=>"saves#all";
  get '/saves/show/:collection_id' => 'saves#show';
  get '/saves/destroy/:collection_id/:user_id' =>'saves#destroy';
  get '/your_tags/new'=>'your_tags#new';
      
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
