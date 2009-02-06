class VideoFile < Media
  has_one :video
  has_attachment :content_type => :video, :storage => :file_system, :path_prefix => 'public/media/videos'
  
  validates_as_attachment
end