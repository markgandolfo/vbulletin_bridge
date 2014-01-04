require_relative 'test_helper.rb'

class ThreadTest < ActiveSupport::TestCase
  
  def setup
    super
    @thread = Vbulletin::Thread.new
  end
  
  test "thread has many posts" do
    post1 = Vbulletin::Post.create
    post2 = Vbulletin::Post.create
    @thread.posts << post1
    @thread.posts << post2
    assert_equal [post1, post2], @thread.posts
  end
  
end