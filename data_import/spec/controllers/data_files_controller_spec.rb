require 'spec_helper'

describe DataFilesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST create" do
    let(:path) { Rails.root.join("spec/data/example_input.tab") }
    let(:file) {  Rack::Test::UploadedFile.new(path) }

    let(:importer) { stub("data importer", :save => true, :gross_revenue => 50) }
    before { DataImporter.stub(:new => importer) }
    it "builds and saves a new DataImporter" do
      importer.should_receive :save
      post :create, :data => file
    end

    it "passes the file on to the importer"  do
      DataImporter.should_receive(:new).with(file.path)
      post :create, :data => file
    end

    it "redirects to the index page" do
      post :create, :data => file
      response.should redirect_to data_files_path
    end

    context "successfully" do
      before { importer.stub(:save => true, :gross_revenue => 100.0) }

      it "sets a success flash with revenue numbers" do
        post :create, :data => file
        flash[:notice].should =~ /Gross Revenue: \$100\.0/
      end


    end

    context "unsuccessfully" do
      before { importer.stub(:save => false) }
      it "sets an error flash" do
        post :create, :data => file
        flash[:error].should be_present
      end
    end

  end

end
