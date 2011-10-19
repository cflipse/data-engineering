class Item < ActiveRecord::Base
  validates :description,  :presence => true
  validates :price_in_cents,  :presence => true

  belongs_to :merchant
  has_many :purchases

  def price
    price_in_cents / 100.0
  end

  def price= p
    self.price_in_cents = p * 100
  end

  def self.for_data(data)
    description = data.description
    price = data.price * 100
    find_or_create_by_description_and_price_in_cents(description, price)
  end
end
