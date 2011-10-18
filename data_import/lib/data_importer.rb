require 'csv'

class DataImporter
  attr_reader :path
  private :path

  def initialize(path)
    @path = path
  end


  def gross_revenue
    purchases.inject(0) do |sum, purchase|
      sum + purchase.total_cost
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
  
  def purchases
    @purchases ||= csv.map{|row| DataImporter::Purchase.new(row) }
  end
end
