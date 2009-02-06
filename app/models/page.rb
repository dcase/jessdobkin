class Page < ActiveRecord::Base
  belongs_to :site_section
  has_many :page_sections, :order => :position
  acts_as_list :scope => :site_section
  
  validates_presence_of :name
  validates_presence_of :scroll_height, :if => :has_scroll
  validates_numericality_of :scroll_height, :if => Proc.new { |e| !e.scroll_height.blank? }
end
