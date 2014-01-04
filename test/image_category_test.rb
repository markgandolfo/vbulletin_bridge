require_relative 'test_helper.rb'

class ImageCategoryTest < ActiveSupport::TestCase
  
  test "image categories are ordered by displayorder by default" do
    avatar1 = Vbulletin::ImageCategory.create(:title => "Category 1", :displayorder => 2)
    avatar2 = Vbulletin::ImageCategory.create(:title => "Category 2", :displayorder => 1)
    assert_equal [avatar2, avatar1], Vbulletin::ImageCategory.all
  end

end