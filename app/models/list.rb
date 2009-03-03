class List < ActiveRecord::Base
  has_one :page_section, :as => :content, :dependent => :destroy
  has_many :list_items, :order => :position, :dependent => :destroy
  
  validates_presence_of :name
  validates_associated :page_section, :message => ': check errors below.'
  
  def before_validation
    if self.name.blank? and self.page_section
      self.name = self.page_section.title unless self.page_section.title.blank?
    end
  end
end
