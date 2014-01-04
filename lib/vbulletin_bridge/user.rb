class Vbulletin::User < ActiveRecord::Base
  
  self.table_name = 'user'
  self.primary_key = 'userid'
  
  has_many :posts, 
           :class_name  => "Vbulletin::Post", 
           :foreign_key => "userid"
  
  belongs_to :avatar, 
             :class_name  => "Vbulletin::Avatar", 
             :foreign_key => "avatarid"
             
  belongs_to :last_post, 
             :class_name  => "Vbulletin::Post", 
             :foreign_key => "lastpostid"
             
  belongs_to :primary_user_group, 
             :class_name  => "Vbulletin::UserGroup", 
             :foreign_key => "usergroupid"
             
  belongs_to :referrer, 
             :class_name  => "Vbulletin::User", 
             :foreign_key => "referrerid"
             
  belongs_to :style, 
             :class_name  => "Vbulletin::Style", 
             :foreign_key => "styleid"
             
  belongs_to :infraction_group, 
             :class_name  => "Vbulletin::InfractionGroup", 
             :foreign_key => "infractiongroupid"
  
  has_one :session, 
          :class_name => "Vbulletin::Session",
          :foreign_key => "userid"

  has_many :subscribed_threads,
          :class_name => "Vbulletin:SubscribeThread",
          :foreign_key => "userid"
  
  def self.authenticate(username, md5_password)
    user = find_by_username(username)
    return user if (user && user.password == crypted_password(md5_password, user.salt))
    return false
  end
  
    private
    
    def self.crypted_password(password, salt)
      Digest::MD5.hexdigest(Digest::MD5.hexdigest(password) + salt)
    end
  
end
