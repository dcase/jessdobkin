class Graphic < Media
  has_one :page_section, :as => :content, :dependent => :destroy
  has_attachment :content_type => :image, :storage => :file_system, :path_prefix => 'public/images/uploads'
  
  validates_presence_of :alt_text
  validates_presence_of :class_name
  validates_presence_of :filename
  validates_associated :page_section, :message => ': check errors below.'
end