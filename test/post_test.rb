require_relative 'test_helper.rb'

class PostTest < ActiveSupport::TestCase
  
  def setup
    super
    @post = Vbulletin::Post.new
  end
  
  test "post belongs to a user" do
    user = Vbulletin::User.create
    @post.user = user
    assert_equal user, @post.user
  end
  
  test "post belongs to a thread" do
    thread = Vbulletin::Thread.create
    @post.thread = thread
    assert_equal thread, @post.thread
  end
  
end