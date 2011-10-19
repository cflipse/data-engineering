require 'spec_helper'

describe DataPersistence do
  context "integration tests" do
    let(:importer) { DataImporter.new( Rails.root.join("spec/data/example_input.tab").to_s )}

    subject { DataPersistence.new(importer.send(:purchases)) }

    describe "save" do
      before { subject.save }


      specify "Snake has two purchases" do
        Customer.where(:name => "Snake Plissken").first.should have(2).purchases
      end

      specify "The sneaker store has two purchases" do
        Merchant.where(:name => "Sneaker Store Emporium").first.should have(2).purchases
      end

    end



  end

end
