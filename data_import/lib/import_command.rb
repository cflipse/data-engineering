file_path = ARGV[0]

unless file_path
  puts "Usage:  script/import <file_name>"
  exit(1)
end

importer = DataImporter.new(file_path)

if importer.save
  puts "Successfully imported data file with gross revenue of $#{importer.gross_revenue}" 
else
  puts "there was a problem importing your data file"
end
