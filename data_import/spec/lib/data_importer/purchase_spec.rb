require 'data_importer'
require 'data_importer/purchase'

describe DataImporter::Purchase do

  describe "#total_cost" do
    it "calculates based on purchase price and quantity" do
      purchase = DataImporter::Purchase.new "item price" => 0.5 , "purchase count" => 20
      purchase.total_cost.should == 10.0
    end
  end

  describe "Extracting data classes" do

    let(:purchase) do
      DataImporter::Purchase.new "item price" => 0.5 , 
        "item description" => "A bag of hammers",
        "purchase count" => 20, 
        "purchaser name" => "Bob", 
        "merchant address" => "123 Main St",
        "merchant name" => "The General's Store"
    end

    describe "#item" do
      it "extracts a purchased item" do
        purchase.item.should == DataImporter::Item.new("A bag of hammers", 0.5)
      end
    end
  end


end
