class CopyText < ActiveRecord::Base
  has_one :page_section, :as => :content
  
  validates_presence_of :output
  validates_associated :page_section, :message => 'probably needs a title or something'
end
