class Vbulletin::UserGroup < ActiveRecord::Base
  
  self.table_name = 'usergroup'
  self.primary_key = 'usergroupid'
  
  has_many :users, :class_name => "Vbulletin::User", :foreign_key => "usergroupid"
  
end
