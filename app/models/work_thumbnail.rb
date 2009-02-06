class WorkThumbnail < Media
  has_one :work
  has_attachment :content_type => :image, :storage => :file_system, :path_prefix => 'public/media/photos/thumbnails', :resize_to => '116x90>'
  
  validates_as_attachment
end