class Vbulletin::PmText < ActiveRecord::Base
  self.table_name = 'pmtext'
  self.primary_key = 'pmtextid'

  belongs_to :user, 
             :class_name  => "Vbulletin::User",
             :foreign_key => "fromuserid"

  belongs_to :user, 
             :class_name  => "Vbulletin::User",
             :foreign_key => "userid"

end

# touserarray
# a:1:{s:2:"cc";a:1:{i:user_id;s:17:"username_string_length";}}