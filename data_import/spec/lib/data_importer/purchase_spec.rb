require 'data_importer'
require 'data_importer/purchase'

describe DataImporter::Purchase do

  describe "#total_cost" do
    it "calculates based on purchase price and quantity" do
      purchase = DataImporter::Purchase.new "item price" => 0.5 , "purchase count" => 20
      purchase.total_cost.should == 10.0
    end
  end

end
