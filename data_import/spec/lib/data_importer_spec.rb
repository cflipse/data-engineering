require 'data_importer'

describe DataImporter do
  let(:path) { File.join(File.dirname(__FILE__), "../data/example_input.tab") }

  describe "#gross_revenue" do
    it "totals all revenue sales from provided TSV" do
      importer = DataImporter.new(path)

      importer.gross_revenue.should == 95.0
    end
  end
end
