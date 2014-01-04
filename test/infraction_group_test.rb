require_relative 'test_helper.rb'

class IngractionGroupTest < ActiveSupport::TestCase
  
  def setup
    super
    @infraction_group = Vbulletin::InfractionGroup.new
  end
  
  test "avatar has a image category" do
    user_group = Vbulletin::UserGroup.create
    @infraction_group.user_group = user_group
    assert_equal user_group, @infraction_group.user_group
  end

end