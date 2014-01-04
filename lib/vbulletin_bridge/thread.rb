class Vbulletin::Thread < ActiveRecord::Base
  
  self.table_name = 'thread'
  self.primary_key = 'threadid'
  
  has_many :posts, :class_name => "Vbulletin::Post", :foreign_key => "threadid"
  
end
