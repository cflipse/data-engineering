require 'spec_helper'

describe Merchant do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }

  describe "validating unique name / address pairings" do
    before do
      Merchant.create :name => "5 Guys", :address => "1234 Main St"
    end

    it { should validate_uniqueness_of(:name).scoped_to(:address) }
    it { should validate_uniqueness_of(:address).scoped_to(:name) }

  end


  it { should have_many :items }
  it { should have_many(:purchases).through :items }
end
