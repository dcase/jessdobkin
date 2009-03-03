class ArticleList < ActiveRecord::Base
  has_one :page_section, :as => :content, :dependent => :destroy
  has_many :article_list_items, :order => :position, :dependent => :destroy
  
  validates_presence_of :name
  validates_associated :page_section, :message => ': check errors below.'
end
