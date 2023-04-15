require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

# Serialized data means it is a string
serialized_data = File.read(filepath)

data = JSON.parse(serialized_data)

# Accessing the last name of the 3rd Beatle
p data["beatles"][2]["last_name"]



# STORING

students = [
  %w[Juri Kato],
  %w[Simone Roveri],
  %w[Zhao Zhan],
  %w[Valerie Keeton],
]

File.open('data/students.json', 'wb') do |file|
  file.write(JSON.generate(students))
end
