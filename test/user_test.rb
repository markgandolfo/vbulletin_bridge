require_relative 'test_helper.rb'

class UserTest < ActiveSupport::TestCase
  
  def setup
    super
    @user = Vbulletin::User.new
  end
  
  test "user has many posts" do
    post = Vbulletin::Post.create
    @user.posts << post 
    assert_equal [post], @user.posts
  end
  
  test "user belongs to avatar" do
    new_avatar = Vbulletin::Avatar.new
    @user.avatar = new_avatar
    assert_equal new_avatar, @user.avatar
  end
  
  test "user has a last post" do
    post = Vbulletin::Post.create
    @user.last_post = post
    assert_equal post, @user.last_post
  end
  
  test "user has a primary user group" do
    group = Vbulletin::UserGroup.create(:title => "Administrators")
    @user.primary_user_group = group
    assert_equal group, @user.primary_user_group
  end
  
  test "user has a referrer" do
    referring_user = Vbulletin::User.create(:username => "Joe Bloggs")
    @user.referrer = referring_user
    assert_equal referring_user, @user.referrer
  end
  
  test "user has a specific forum style" do
    default_style = Vbulletin::Style.create(:title => "Default Style")
    @user.style = default_style
    assert_equal default_style, @user.style
  end
  
  test "user has a infraction group" do
    new_infraction_group = Vbulletin::InfractionGroup.create
    @user.infraction_group = new_infraction_group
    assert_equal new_infraction_group, @user.infraction_group
  end
  
  test "successful user authentication" do
    assert_equal setup_user_with_password, Vbulletin::User.authenticate('JoeBloggs', 'my_password')
  end
  
  test "failed user authentication with invalid password" do
    setup_user_with_password
    assert !Vbulletin::User.authenticate('JoeBloggs', 'incorrect-password')
  end
  
  test "failed user authentication with invalid username" do
    setup_user_with_password
    assert !Vbulletin::User.authenticate('JaneBloggs', 'my_password')
  end
  
    private
    
    def setup_user_with_password
      Vbulletin::User.create(
        :username => "JoeBloggs",
        :password => "ecd3be4b0af08d776c4ab46f466663ef", # md5 hash for password 'my_password' with salt 'abc
        :salt     => 'abc'
      )
    end
  
end