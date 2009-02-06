class ArticleListItem < ActiveRecord::Base
  belongs_to :article_list
  acts_as_list :scope => :article_list
  belongs_to :article
  
  validates_presence_of :output
  validates_presence_of :url, :if => Proc.new { |a| a.is_link? }, :message => "cannot be blank if this is a link"
  validates_presence_of :article, :unless => Proc.new { |a| a.is_link? }, :message => "cannot be blank if this is not a link"
  
  def before_destroy
    self.article.destroy
  end
end
