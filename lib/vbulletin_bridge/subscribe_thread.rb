class Vbulletin::SubscribeThread < ActiveRecord::Base
  self.table_name = 'subscribethread'
  self.primary_key = 'subscribethreadid'

  belongs_to :user, 
             :class_name  => "Vbulletin::User",
             :foreign_key => "userid"

  belongs_to :thread, 
             :class_name  => "Vbulletin::Thread",
             :foreign_key => "threadid"

end