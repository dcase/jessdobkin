class Graphic < Media
  has_one :page_section, :as => :content
  has_attachment :content_type => :image, :storage => :file_system, :path_prefix => 'public/images/uploads'
  
  validates_presence_of :alt_text
  validates_presence_of :class_name
  validates_associated :page_section, :message => 'probably needs a title or something'
end