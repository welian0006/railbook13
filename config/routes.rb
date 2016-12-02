require 'TimeConstraint'
Railbook13::Application.routes.draw do


  resources :tennis


  resources :suns


  resources :clonets


  resources :sports


  resources :fruits


  resources :configs


  resources :fun_comments


  resources :authors


  #resources :users,:except => ['show','destroy']
  resources :users, :only => ['index','new']

  #resources :reviews, :as => 'xxxs'
  #resources :books, :constraints => [{:id => /[0-9]{1,2}/},TimeConstraint.new]
  
  #resources :books do
  	#resources :reviews
  #end
  
  scope "(:locale)",:locale => /ja|en|de/ do
  	resources :books
	match ':controller(/:action(/:id(.:format)))'
  end
  
  resources :reviews,:path_names => {:new =>'insert',:edit=>'revise'} do
  	collection do
		get 'unapproval'
	end
	
	collection do
		get 'to_unapproval'
	end
	
	member do
		get 'draft'
	end
  end
  
  #resources :books, :constraints => TimeConstraint.new	
	
  #scope 'admin' do
  	#resources :books
  # end		
	
  #constraints(:id=>/[0-9]{1,2}/) do
  	#resources :books
	#resources :reviews
  #end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  
  #match '/hello(/:category)'=>'hello#index',:defaults=>{:category=>'general',:format=>'xml'}
  #match '/hello/*category/:id' => 'hello#category'
  #match '/admin/books/test_folder' => 'admin/books#test_folder'
  match ':controller(/:action(/:id))(.:format)'
  
  match '/:locale' => 'books#index'
  root :to => 'books#index'
end
