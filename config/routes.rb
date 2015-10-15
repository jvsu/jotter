Rails.application.routes.draw do
  
  get 'your_tags/new'

  get 'your_tags/create'

  get 'your_tags/index'

  get 'your_tags/view'

  get 'your_tags/all'

  get 'tags/share'

  get 'tags/add'

  get 'tags/remove'

  get 'tags/new'

  get 'tags/all'

  get 'tags/unshare'

  get 'saves/create'

  get 'saves/new'

  get 'saves/all'

  get 'saves/show'

  get 'note_supports/all'

  get 'note_supports/new'

  get 'note_supports/create'

  get 'note_supports/view'

  get 'note_supports/delete'

  get 'points/all'

  get 'points/new'

  get 'points/create'

  get 'points/view'

  get '/points/delete/:point_id/:user_id/:paper_id' =>"points#delete"

  get 'papers/index'    

  get '/papers/new/:paper_id'=>'papers#new'
  get '/papers/delete/:paper_id' =>"papers#delete"

  get 'papers/create'

  get 'papers/all'

  get 'papers/view'

    root to: "sessions#index"
    match '/sessions/index'=>'sessions#index', :via=>[:get,:post]
    match '/sessions/sign_up'=>'sessions#sign_up', :via=>[:get,:post]
    match '/sessions/sign_in'=>'sessions#sign_in', :via=>[:get,:post]
    match '/homes/index'=>'homes#index', :via=>[:get,:post]
    match '/sessions/destroy'=>'sessions#destroy', :via=>[:get,:post]
    match '/collections/create/'=>'collections#create', :via=>[:get,:post]
    match '/notes/create/'=>'notes#create', :via=>[:get,:post]
    get '/notes/new/:collection_id' => 'notes#new';
    match '/notes/update/' => 'notes#update', :via=>[:get,:post];
    get '/notes/destroy/:note_id/:collection_id' => 'notes#destroy';
    match '/collections/all/' => 'collections#all', :via=>[:get,:post];
    get '/collections/destroy/:collection_id' => 'collections#destroy';
    match '/groups/new/' => 'groups#new', :via=>[:get,:post];
    match '/groups/create/' => 'groups#create', :via=>[:get,:post];
    get '/groups/view/:group_id' => 'groups#view';
    get '/groups/select/:group_id' => 'groups#select';
    match '/groups/all/' => 'groups#all', :via=>[:get,:post];
    match '/groupnotes/create/' => 'group_notes#create', :via=>[:get,:post];
    match '/groupnotes/delete/' => 'group_notes#delete', :via=>[:get,:post];
    get '/notes/retrieve/:notes_id' => 'notes#retrieve';
    match '/papers/create/' => 'papers#create', :via=>[:get,:post];
    match '/papers/edit/' => 'papers#edit', :via=>[:get,:post];
    match '/points/create/' => 'points#create', :via=>[:get,:post]; 
    match '/points/edit/' => 'points#edit', :via=>[:get,:post];
    get '/notesupports/all_groups/:point_id' => 'note_supports#all_groups';
    get '/notesupports/group/:group_id/:point_id' => 'note_supports#group';
    match '/note_supports/create' => 'note_supports#create', :via=>[:get,:post];
    match '/groups/delete/:group_id/:user_id' => 'groups#delete', :via=>[:get,:post];
    match '/tags/share/' => 'tags#share', :via=>[:get,:post]; 
     get '/tags/unshare/:collection_id' => 'tags#unshare'   
     get '/tags/add' =>"tags#add"
     get '/tags/remove'=>"tags#remove"
    get '/saves/show/:collection_id' => 'saves#show';
    
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
