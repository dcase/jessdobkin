class ChronologyItem < ActiveRecord::Base
  belongs_to :chronology
  acts_as_list :scope => :chronology
  
  validates_presence_of :output
  validates_presence_of :time_start
  validate :time_end_or_to_present?
  
  private
  
  def time_end_or_to_present?
    if to_present? and !time_end.blank?
      errors.add(:time_end, 'cannot be a year if to_present is selected.')
    end
  end
end
