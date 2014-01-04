class Vbulletin::InfractionGroup < ActiveRecord::Base
  
  self.table_name = 'infractiongroup'
  self.primary_key = 'infractiongroupid'
  
  belongs_to :user_group, 
            :class_name => "Vbulletin::UserGroup", 
            :foreign_key => "usergroupid"
  
end
