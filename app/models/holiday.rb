class Holiday < ActiveRecord::Base
  attr_accessible :date, :description

  validates :date, :description, :presence => true
end
