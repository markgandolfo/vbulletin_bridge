class Vbulletin::Avatar < ActiveRecord::Base
  self.table_name = 'avatar'
  self.primary_key = 'avatarid'
  
  belongs_to :image_category, 
            :class_name => "Vbulletin::ImageCategory", 
            :foreign_key => "imagecategoryid"
  
  default_scope { order("displayorder ASC") }
  
end
