require 'spec_helper'

describe Customer do
  it { should have_many :purchases }
  it { should validate_presence_of :name }

  describe "uniqueness" do
    before { Customer.create :name => "Bob" }
    it { should validate_uniqueness_of :name }
  end
end
