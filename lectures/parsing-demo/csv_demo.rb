require "csv"

# TODO - let's read/write data from beatles.csv
filepath = "data/beatles.csv"

# # PARSING CSV

# CSV.foreach(filepath) do |row|
#   puts '-----'
#   puts "#{row[0]} #{row[1]} plays the #{row[2]}"
# end

# # With headers

# CSV.foreach(filepath, headers: :first_row) do |row|
#   # With the `headers` options, we take out the first row
#   # and we can access the data like a Hash (or an Array)
#   p row[0]
#   puts "#{row['First Name']} #{row['Last Name']} plays the #{row['Instrument']}"
# end

# STORING CSV


students = [
  %w[Juri Kato],
  %w[Simone Roveri],
  %w[Zhao Zhan],
  %w[Valerie Keeton],
]

CSV.open('data/students.csv', 'wb') do |csv_file|
  csv_file << ['first_name', 'last_name']
  students.each do |student|
    csv_file << student
  end
end