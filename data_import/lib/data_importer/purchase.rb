class DataImporter::Item < Struct.new(:description, :price); end

class DataImporter::Purchase
  attr_reader :data
  private :data
  
  def initialize(attributes_hash)
    @data = attributes_hash
    parse_data(attributes_hash)
  end

  def total_cost
    data["purchase count"] * data["item price"]
  end

  def item
    @item
  end
        
private
  def parse_data(hash)
    @item = DataImporter::Item.new hash["item description"], hash["item price"]
  end

end
