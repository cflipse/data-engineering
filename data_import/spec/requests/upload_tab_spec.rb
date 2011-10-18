require 'spec_helper'

describe "uploading a tab delimited file" do
  let(:path) { Rails.root.join("spec/data/example_input.tab") }


  it "imports the contents of the file"

  it "displays the gross sales figure for the uploaded file" do
    visit "/"
    attach_file "Data", path
    click_on "Import Data"

    page.should have_content("Gross Revenue $95.00")
  end


end
