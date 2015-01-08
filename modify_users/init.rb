require 'redmine'

require_dependency 'modify_users/users_controller_patch'


Redmine::Plugin.register :modify_users do
  name 'Modify Users plugin'
  author 'nmgfrank'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://www.nmgfrankblog.sinaapp.com/'
  author_url 'http://www.nmgfrankblog.sinaapp.com/'  
end
