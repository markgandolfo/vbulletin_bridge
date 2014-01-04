require "test/unit"
require "rubygems"
require "active_record"
require "active_record/fixtures"
require "turn"
require File.dirname(__FILE__) + '/../lib/vbulletin_bridge'

ActiveRecord::Schema.verbose = true
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Base.configurations = true

ActiveRecord::Schema.define(:version => 1) do
  
  create_table :avatar, :primary_key => :avatarid do |t|
    t.string :title
    t.integer :minimumposts
    t.string :avatarpath
    t.integer :imagecategoryid
    t.integer :displayorder
  end
  
  create_table :imagecategory, :primary_key => :imagecategoryid do |t|
    t.string :title
    t.integer :imagetype
    t.integer :displayorder
  end
  
  create_table :infractiongroup, :primary_key => :infractiongroupid do |t|
  end
  
  create_table :pm, :primary_key => :pmid do |t|
    t.integer :pmtextid
    t.integer :userid
    t.integer :folderid, :default => 0
    t.integer :messageread, :default => 0
    t.integer :importpmid, :default => 0
    t.integer :parentid, :default => 0
  end

  create_table :pmtext, :primary_key => :pmtextid do |t|
    t.integer :fromuserid
    t.string :fromusername
    t.string :title
    t.text :message
  end

  create_table :post, :primary_key => :postid do |t|
    t.integer :userid
  end

  create_table :session do |t|
    t.integer :userid
  end

  create_table :setting do |t|
    t.string :varname
  end
  
  create_table :style, :primary_key => :styleid do |t|
    t.string :title
  end

  create_table :thread, :primary_key => :threadid do |t|
    t.string :title
  end
  
  create_table :user, :primary_key => :userid do |t|
    t.string :username
    t.string :password, :length => 32
    t.string :salt, :length => 3
  end
  
  create_table :usergroup, :primary_key => :usergroupid do |t|
    t.string :title
  end

  create_table :subscribethread, :primary_key => :subscribethreadid do |t|
    t.integer :userid
    t.integer :threadid
    t.integer :emailupdate
    t.integer :folderid, :default => 0
    t.integer :canview, :default => 1
  end


end

class ActiveSupport::TestCase
  
  def setup
    delete_all
  end
  
    private
    
    def delete_all
      Vbulletin::Avatar.delete_all
      Vbulletin::ImageCategory.delete_all
      Vbulletin::InfractionGroup.delete_all
      Vbulletin::Pm.delete_all
      Vbulletin::PmText.delete_all
      Vbulletin::Post.delete_all
      Vbulletin::Session.delete_all
      Vbulletin::Setting.delete_all
      Vbulletin::Style.delete_all
      Vbulletin::SubscribeThread.delete_all
      Vbulletin::Thread.delete_all
      Vbulletin::User.delete_all
      Vbulletin::UserGroup.delete_all
    end
  
end
