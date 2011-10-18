class Merchant < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => { :scope => :address }
  validates :address, :presence => true, :uniqueness => { :scope => :name }

  has_many :items
end
