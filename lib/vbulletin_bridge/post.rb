class Vbulletin::Post < ActiveRecord::Base
  
  self.table_name = 'post'
  self.primary_key = 'postid'
  
  belongs_to :user, 
            :class_name => "Vbulletin::User", 
            :foreign_key => "userid"

  belongs_to :thread, 
            :class_name => "Vbulletin::Thread", 
            :foreign_key => "threadid"
  
end
