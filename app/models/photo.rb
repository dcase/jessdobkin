class Photo < Media
  has_attachment :content_type => :image, :storage => :file_system, :path_prefix => 'public/media/photos', :resize_to => '445x445>', :thumbnails => { :thumb => '116x116>' }
  has_many :work_photos, :dependent => :destroy
  has_many :works, :through => :work_photos
  
end