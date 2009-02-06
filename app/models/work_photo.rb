class WorkPhoto < ActiveRecord::Base
  belongs_to :work
  belongs_to :photo
  
  acts_as_list :scope => :work
end
