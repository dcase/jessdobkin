class Article < Media
  belongs_to :article_list_item
  acts_as_list :scope => :article_list_item
  has_attachment :content_type => :image, :storage => :file_system, :path_prefix => 'public/media/articles', :resize_to => "900x>", :thumbnails => { :thumb => '100x100>' }

  validates_presence_of :filename
end