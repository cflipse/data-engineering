class Customer < ActiveRecord::Base
  has_many :purchases

  validates :name, :presence => true, :uniqueness => true

  def self.for_data(data)
    find_or_create_by_name(data.name)
  end
end
