class Video < ActiveRecord::Base
  belongs_to :video_file
  has_one :work, :dependent => :nullify
  
  acts_as_list
  
  validates_presence_of :title
  validates_presence_of :date_filmed
  validates_presence_of :description
  
  def before_destroy
    self.video_file.destroy
  end
end
