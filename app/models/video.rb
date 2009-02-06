class Video < ActiveRecord::Base
  belongs_to :video_file
  has_one :work
  
  acts_as_list
  
  validates_presence_of :title
  validates_presence_of :date_filmed
  validates_presence_of :description
  validates_presence_of :video_file
end
