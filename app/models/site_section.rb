class SiteSection < ActiveRecord::Base
  has_many :pages, :order => :position, :dependent => :destroy
  acts_as_list
  
  validates_presence_of :name
  validates_presence_of :url, :if => Proc.new { |e| e.is_external? }
  
  def to_param
    "#{id}-#{name.downcase.strip.gsub(/\ /, '-').gsub(/[^\w\-]/, '').gsub(/[-]+/, '-')}"
  end
end
