class DataImporter::Purchase
  attr_reader :data
  private :data
  
  def initialize(attributes_hash)
    @data = attributes_hash
  end

  def total_cost
    data["purchase count"] * data["item price"]
  end

end
