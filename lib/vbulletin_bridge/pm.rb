class Vbulletin::Pm < ActiveRecord::Base
  self.table_name = 'pm'
  self.primary_key = 'pmid'

  belongs_to :pmtext, 
             :class_name  => "Vbulletin::PmText",
             :foreign_key => "pmtextid"

  belongs_to :user, 
             :class_name  => "Vbulletin::User",
             :foreign_key => "userid"

end