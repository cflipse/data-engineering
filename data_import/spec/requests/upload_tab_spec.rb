require 'spec_helper'

describe "uploading a tab delimited file" do
  let(:path) { Rails.root.join("spec/data/example_input.tab") }

  before do
    visit "/"
    attach_file "Data", path
    click_on "Import Data"
  end


  it "displays the gross sales figure for the uploaded file" do
    page.should have_content("Gross Revenue: $95.00")
  end


  it "imports the contents of the file" do
    # note that this is extremly depednant on the input file data
    Item.count.should == 3
    Customer.count.should == 3
    Merchant.count.should == 3
    Purchase.count.should == 4
  end

end
