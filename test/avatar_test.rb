require_relative 'test_helper.rb'

class AvatarTest < ActiveSupport::TestCase
  
  def setup
    super
    @avatar = Vbulletin::Avatar.new
  end
  
  test "avatar has a image category" do
    category = Vbulletin::ImageCategory.create
    @avatar.image_category = category
    assert_equal category, @avatar.image_category
  end
  
  test "avatars are ordered by displayorder by default" do
    avatar1 = Vbulletin::Avatar.create(:title => "Avatar 1", :displayorder => 2)
    avatar2 = Vbulletin::Avatar.create(:title => "Avatar 2", :displayorder => 1)
    assert_equal [avatar2, avatar1], Vbulletin::Avatar.all
  end
end