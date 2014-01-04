class Vbulletin::Setting < ActiveRecord::Base
  
  self.table_name = 'setting'
  self.primary_key = 'varname'
  
  def self.ipcheck
    @ipcheck ||= get_ipcheck
  end
  
  def self.get_ipcheck
    ipcheck = where("varname = ?", 'ipcheck').first
    return ipcheck.value if ipcheck
    nil
  end
end