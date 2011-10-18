class Item < ActiveRecord::Base
  validates :description,  :presence => true
  validates :price_in_cents,  :presence => true
end
