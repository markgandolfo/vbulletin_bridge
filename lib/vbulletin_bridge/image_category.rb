class Vbulletin::ImageCategory < ActiveRecord::Base
  
  self.table_name = 'imagecategory'
  self.primary_key = 'imagecategoryid'
  
  default_scope { order("displayorder ASC") }
end
