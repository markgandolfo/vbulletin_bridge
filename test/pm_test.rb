require_relative 'test_helper.rb'

class PostTest < ActiveSupport::TestCase
  
  def setup
    super
    @pm = Vbulletin::Pm.new
  end
  
  test "pm belongs to a user" do
    user = Vbulletin::User.create
    @pm.user = user
    assert_equal user, @pm.user
  end
  
  test "pm has a body" do
    pm_text = Vbulletin::PmText.create
    @pm.pmtext = pm_text
    assert_equal pm_text, @pm.pmtext
  end

end