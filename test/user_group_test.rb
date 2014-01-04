require_relative 'test_helper.rb'

class UserGroupTest < ActiveSupport::TestCase
  
  def setup
    super
    @usergroup = Vbulletin::UserGroup.new
  end
  
  test "usergroup has many users" do
    user1 = Vbulletin::User.create
    user2 = Vbulletin::User.create
    @usergroup.users << user1
    @usergroup.users << user2
    assert_equal [user1, user2], @usergroup.users
  end
  
end