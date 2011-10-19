require 'spec_helper'

describe DataPersistence do
  context "integration tests" do
    let(:importer) { DataImporter.new( Rails.root.join("spec/data/example_input.tab").to_s )}

    subject { DataPersistence.new(importer.send(:purchases)) }

    describe "save" do
      before { subject.save }

      it "builds unique merchants" do
        Merchant.count.should == 3
      end

      it "builds unique items" do
        Item.count.should == 3
      end

      it "builds unique customers" do
        Customer.count.should == 3
      end

      it "builds all purchases" do
        Purchase.count.should == 4
      end

    end



  end

end
