class QuoteList < ActiveRecord::Base
  has_one :page_section, :as => :content
  has_many :quotes, :order => :position, :dependent => :destroy
  
  validates_presence_of :name
  validates_associated :page_section, :message => 'probably needs a title or something'
end
