class Work < ActiveRecord::Base
  belongs_to :work_thumbnail
  belongs_to :video
  has_many :work_photos, :order => :position, :dependent => :destroy
  has_many :photos, :through => :work_photos, :order => :position, :dependent => :destroy
  
  acts_as_list :scope => 'is_early = 0'
  acts_as_list :scope => 'is_early = 1'
  
  validates_presence_of :title
  validates_presence_of :venue
  validates_presence_of :description
  validates_presence_of :work_thumbnail
  validate :date_end_or_ongoing?
  
  private
  
  def date_end_or_ongoing?
    if is_ongoing? and !date_end.blank?
      errors.add(:date_end, 'cannot be a year if work is ongoing.')
    end
  end
end
