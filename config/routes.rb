Rails.application.routes.draw do
  

  root to: "sessions#home";
  # match '/sessions/index'=>'sessions#index', :via=>[:get,:post]
  get '/sessions/index'=>'sessions#index';
  get '/sessions/home'=>'sessions#home';
  # match '/sessions/sign_up'=>'sessions#sign_up', :via=>[:get,:post]
  # match '/sessions/sign_in'=>'sessions#sign_in', :via=>[:get,:post]
  post '/sessions/sign_up'=>'sessions#sign_up';
  post '/sessions/sign_in'=>'sessions#sign_in';

  # match '/homes/index'=>'homes#index', :via=>[:get,:post]
  get '/homes/index'=>'homes#index';

  match '/sessions/destroy'=>'sessions#destroy', :via=>[:get,:post]
  # get '/sessions/destroy'=>'sessions#destroy';
    # match '/collections/create/'=>'collections#create', :via=>[:get,:post]
  post '/collections/create/'=>'collections#create';
    # match '/notes/create/'=>'notes#create', :via=>[:get,:post]
  post '/notes/create/'=>'notes#create';

  get '/notes/new/:collection_id' => 'notes#new';
    # match '/notes/update/' => 'notes#update', :via=>[:get,:post];
    post '/notes/update/' => 'notes#update';

    get '/notes/destroy/:note_id/:collection_id' => 'notes#destroy';

    # match '/collections/all/' => 'collections#all', :via=>[:get,:post];
    get '/collections/all/' => 'collections#all';

    get '/collections/destroy/:collection_id' => 'collections#destroy';

    # match '/groups/new/' => 'groups#new', :via=>[:get,:post];
    get '/groups/new/' => 'groups#new';

    # match '/groups/create/' => 'groups#create', :via=>[:get,:post];
    post '/groups/create/' => 'groups#create';
    get '/groups/view/:group_id' => 'groups#view';
    get '/groups/select/:group_id' => 'groups#select';
    get '/saves/select/:group_id' => 'saves#select';

    # match '/groups/all/' => 'groups#all', :via=>[:get,:post];
    get '/groups/all/' => 'groups#all';
    # match '/groupnotes/create/' => 'group_notes#create', :via=>[:get,:post];
    post '/groupnotes/create/' => 'group_notes#create'

    # match '/groupnotes/delete/' => 'group_notes#delete', :via=>[:get,:post];
    post '/groupnotes/delete/' => 'group_notes#delete';
    get '/notes/retrieve/:notes_id' => 'notes#retrieve';
    # match '/papers/create/' => 'papers#create', :via=>[:get,:post];
    # post '/papers/create/' => 'papers#create';
    # match '/papers/edit/' => 'papers#edit', :via=>[:get,:post];
    # match '/points/create/' => 'points#create', :via=>[:get,:post]; 
    # match '/points/edit/' => 'points#edit', :via=>[:get,:post];
    # get '/notesupports/all_groups/:point_id' => 'note_supports#all_groups';
    # get '/notesupports/group/:group_id/:point_id' => 'note_supports#group';
    # match '/note_supports/create' => 'note_supports#create', :via=>[:get,:post];
    # match '/groups/delete/:group_id/:user_id' => 'groups#delete', :via=>[:get,:post];
    get '/groups/delete/:group_id/:user_id' => 'groups#delete';
    # match '/tags/share/' => 'tags#share', :via=>[:get,:post]; 
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
