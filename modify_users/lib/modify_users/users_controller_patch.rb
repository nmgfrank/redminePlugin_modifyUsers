require_dependency 'users_controller'
require 'redmine/pagination'


module ModifyUsers
    module UsersControllerPatch
        def self.included(base)
            base.send(:include, InstanceMethods)
            
            base.class_eval do
                
            
            end
        end 

    end
    
    module InstanceMethods
        def index_multiusers_search
            sort_init 'login', 'asc'
            sort_update %w(login firstname lastname mail admin created_on last_login_on)

            @status = params[:status] || 1
            
            name_str = params[:name].to_s
            splitter = params[:splitter]
            
            if splitter == "\\n"
                @splitter = "\n"
            else
                @splitter = splitter
            end
            name_list = name_str.split(@splitter)
            Rails.logger.info name_list
            
            
            @users_hash = {}
            
            name_list.each do |name|
                name = name.chomp
                scope = User.logged.status(@status)
                scope = scope.like(name) if name.present?
                scope = scope.in_group(params[:group_id]) if params[:group_id].present?
                @users_hash[name] = scope.order(sort_clause).all
            end


            respond_to do |format|
              format.html {
                @groups = Group.all.sort
                render :layout => !request.xhr?
              }
              format.api
            end   
        end 
    end
end

UsersController.send(:include, ModifyUsers::UsersControllerPatch)
