class Merchant < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => { :scope => :address }
  validates :address, :presence => true, :uniqueness => { :scope => :name }

  has_many :items
  has_many :purchases, :through => :items

  def self.for_data(data)
    find_or_create_by_name_and_address(data.name, data.address)
  end
end

