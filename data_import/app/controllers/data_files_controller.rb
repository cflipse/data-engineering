require 'data_persistence'
class DataFilesController < ApplicationController
  def index
  end

  def create
    importer = DataImporter.new(params[:data].path)

    if importer.save
      flash[:notice] = "Successfully imported data.  Gross Revenue: $#{importer.gross_revenue}"
    else
      flash[:error] = "There was a problem importing your file"
    end

    redirect_to data_files_path
  end

end
