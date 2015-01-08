# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match 'multiusers', :to => 'users#index_multiusers_search', :via => [:get, :post]
