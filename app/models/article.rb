class Article < Media
  has_one :article_list_item
  has_attachment :content_type => :image, :storage => :file_system, :path_prefix => 'public/media/articles', :resize_to => '800x500>', :thumbnails => { :thumb => '100x100>' }

  validates_as_attachment
end