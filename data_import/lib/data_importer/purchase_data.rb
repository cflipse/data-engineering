class DataImporter::ItemData < Struct.new(:description, :price); end
class DataImporter::MerchantData < Struct.new(:name, :address); end
class DataImporter::CustomerData < Struct.new(:name) ; end

class DataImporter::PurchaseData
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
    @item = DataImporter::ItemData.new hash["item description"], hash["item price"]
    @merchant = DataImporter::MerchantData.new hash["merchant name"], hash["merchant address"]
    @customer = DataImporter::CustomerData.new hash["purchaser name"]
  end
end
