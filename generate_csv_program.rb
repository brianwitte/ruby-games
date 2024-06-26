# This Ruby script generates a Ruby file for CSV manipulation, taking the output filename and an optional CSV filename as arguments
if ARGV.empty? || ARGV[0].strip == '-h' || ARGV[0].strip == '--help'
  puts "Usage: ruby #{__FILE__} output_filename.rb [csv_filename.csv]"
  puts "  output_filename.rb  - The name of the Ruby file to be generated."
  puts "  csv_filename.csv    - Optional: The CSV file to be manipulated."
  exit
end

output_filename = ARGV[0]
csv_filename = ARGV[1] || 'max-board-games-v2024.04.08.csv'

File.open(output_filename, "w") do |file|
  file.puts <<-RUBY
require 'csv'

# Load CSV data from the provided filename into an array of hashes (maps).
games_array = CSV.read(
  '#{csv_filename}',
  headers: true,
  header_converters: :symbol
).map(&:to_h)

first_game = games_array.first # get first game in games_array
puts "Accessing first game using []: \#{first_game[:name]}"

# You can reverse an Array.
reversed_games = games_array.reverse
puts "First game after reversing: \#{reversed_games.first[:name]}"
# Reverse the reversed_games array in place!
reversed_games.reverse!
puts "First game after re-reversing in place: \#{games_array.first[:name]}"

# Example function that prints all game names
def print_all_game_names(games)
  games.each { |game| puts game[:name] }
end

# Example usage of the function
print_all_game_names(games_array)

# TODO: Add function to sort games by year
def sort_games_by_year
  # Implementation goes here
end

# TODO: Add function to filter games by mechanic
def filter_games_by_mechanic
  # Implementation goes here
end

# TODO: Add function to modify game ratings
def modify_game_ratings
  # Implementation goes here
end
  RUBY
end

puts "#{output_filename} has been successfully generated!"
