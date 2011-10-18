require 'csv'

class DataImporter
  attr_reader :path
  private :path

  def initialize(path)
    @path = path
  end


  def gross_revenue
    csv.inject(0) do |sum, row|
      sum + (row["purchase count"] * row["item price"])
    end
  end

  private

  def file
    @file ||= File.new(path)
  end

  def csv 
    CSV.read file, :headers => true, :col_sep => "\t",
      :converters => :all
  end

end
