class Purchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :customer

  validates :count, :presence => true
end
