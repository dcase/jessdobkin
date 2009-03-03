class CopyText < ActiveRecord::Base
  has_one :page_section, :as => :content, :dependent => :destroy
  
  validates_presence_of :output
  validates_associated :page_section, :message => ': check errors below.'
end
