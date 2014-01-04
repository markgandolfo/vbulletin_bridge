class Vbulletin::Session < ActiveRecord::Base
  
  self.table_name = 'session'
  self.primary_key = 'sessionhash'
  
  belongs_to :user, 
            :class_name => "Vbulletin::User", 
            :foreign_key => "userid"
  
  def self.find_or_create(user, sessionhash, request)
    session = self.where("sessionhash = ?", sessionhash).first
    unless session
      session = new(:userid => user.id, :loggedin => 2, :lastactivity => Time.now.to_i, :host => request.env['REMOTE_ADDR'], :useragent => request.env['HTTP_USER_AGENT'], :idhash => generate_iphash(request.env['HTTP_USER_AGENT'], request.env['REMOTE_ADDR']))
      session.sessionhash = generate_sessionhash
      session.save!
    else
      if session.location.grep(/logout/)
        session.update_attributes(:userid => user.id, :lastactivity => Time.now.to_i, :loggedin => 2, :location => "")
      else
        session.update_attributes(:userid => user.id, :lastactivity => Time.now.to_i, :loggedin => 2)
      end
    end
    session
  end
  
  def self.logout sessionhash
    session = self.where("sessionhash = ?", sessionhash).first
    session.destroy if session
  end
  
  private
    def self.fetch_substr_ip( host, length = 1 )
      length = length.to_i
      host.split('.').slice(0,4 - length).join('.')
    end
  
    def self.generate_iphash(useragent, host)
      Digest::MD5.hexdigest(useragent + fetch_substr_ip(host, Vbulletin::Setting.ipcheck))
    end
  
    def self.generate_sessionhash
      Digest::MD5.hexdigest(Time.now.usec.to_s)
    end

end