require 'spec_helper'

describe Item do
  it { should validate_presence_of :description }
  it { should validate_presence_of :price_in_cents }

  it { should belong_to :merchant }

  describe "#price" do
    it "returns a decimal value based on price_in_cents" do
      item = Item.new :price_in_cents => 150
      item.price.should == 1.50
    end
  end

  describe "#price=" do
    it "stores it's value in price_in_cents" do
      item = Item.new :price => 0.75
      item.price_in_cents.should == 75
    end

  end
end
