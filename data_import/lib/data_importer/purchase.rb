class DataImporter::Item < Struct.new(:description, :price); end
class DataImporter::Merchant < Struct.new(:name, :address); end
class DataImporter::Customer < Struct.new(:name) ; end

class DataImporter::Purchase
  attr_reader :data, :count, :item, :merchant, :customer
  private :data
  
  def initialize(attributes_hash)
    @data = attributes_hash
    parse_data(attributes_hash)
  end

  def total_cost
    count * item.price
  end
        
private
  def parse_data(hash)
    @count  = hash["purchase count"]
    @item = DataImporter::Item.new hash["item description"], hash["item price"]
    @merchant = DataImporter::Merchant.new hash["merchant name"], hash["merchant address"]
    @customer = DataImporter::Customer.new hash["purchaser name"]
  end
end
