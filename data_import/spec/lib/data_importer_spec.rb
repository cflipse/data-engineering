require 'data_importer'

describe DataImporter do
  class DataPersistence ; end

  let(:path) { File.join(File.dirname(__FILE__), "../data/example_input.tab") }

  describe "#gross_revenue" do
    it "totals all revenue sales from provided TSV" do
      importer = DataImporter.new(path)

      importer.gross_revenue.should == 95.0
    end
  end

  describe "#save" do
    it "delegates to a DataPersistance object" do
      importer = DataImporter.new(path)
      persistence = stub("persistence")

      DataPersistence.should_receive(:new).with(importer).and_return persistence
      persistence.should_receive(:save).and_return true

      importer.save
    end

  end
end
