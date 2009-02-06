class Quote < ActiveRecord::Base
  belongs_to :quote_list
  acts_as_list :scope => :quote_list
  
  validates_presence_of :output
  validates_presence_of :author, :if => Proc.new { |q| q.source.blank? }, :message => "cannot be blank if source is blank"
  validates_presence_of :source, :if => Proc.new { |q| q.author.blank? }, :message => "cannot be blank if author is blank"
end
