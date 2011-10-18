class DataImporter::Item < Struct.new(:description, :price); end

class DataImporter::Purchase
  attr_reader :data, :count
  private :data
  
  def initialize(attributes_hash)
    @data = attributes_hash
    parse_data(attributes_hash)
  end

  def total_cost
    count * item.price
  end

  def item
    @item
  end
        
private
  def parse_data(hash)
    @count  = hash["purchase count"]
    @item = DataImporter::Item.new hash["item description"], hash["item price"]
  end

end
