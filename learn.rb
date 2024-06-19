# *******************************************************************************
# This file was originally taken from the Learn X in Y Minutes page for Ruby:
#
# https://github.com/adambard/learnxinyminutes-docs/blob/1baca665b842c6b346e524aaa14b75479e294db9/ruby.html.markdown#L1
#
# The contributors to the original work from which this file is derived are
# listed in the above permalink.
#
# This file has been modified and these modifications do not entail endorsement
# from any prior contributors.
#
# This original work was distributed under the license linked below:
# https://creativecommons.org/licenses/by-sa/3.0/deed.en
#
# The legalcode.txt for the linked 'CC BY-SA 3.0' is included in this directory.
#
# This modified file is distributed under the same conditions of the original
# work from which it is derived.
#
# See the legalcode.txt in this directory for more information.
# *******************************************************************************


#  _                            ______      _
# | |                           | ___ \    | |
# | |     ___  __ _ _ __ _ __   | |_/ /   _| |__  _   _
# | |    / _ \/ _` | '__| '_ \  |    / | | | '_ \| | | |
# | |___|  __/ (_| | |  | | | | | |\ \ |_| | |_) | |_| |
# \_____/\___|\__,_|_|  |_| |_| \_| \_\__,_|_.__/ \__, |
#                                                  __/ |
#                                                 |___/


#-------------------------------------------------------------------------------
# Step 0: Preliminaries
#-------------------------------------------------------------------------------

# This is a comment

# This is a multi-line comment.
# The beginning line must start with "=begin"
# and the ending line must start with...

puts "This is not a comment. Neither are the 3 lines under this."
puts "They are not between lines prefixed =begin/=end."
puts "Neither are they on a single line prefixed with #."
puts "These 4 lines will print to STDOUT when evaluated."

# puts "This will NOT print to STDOUT when evaluated."

# Also, you can do this, or start each line in
# a multi-line comment with the # character.
#
# Just
# like
# this...



# In Ruby, (almost) everything is an object.
# This includes numbers...
3.class #=> Integer (object)

# The '.class' method called on 3 returns the
# type of object of the value it is called on.


# ...and strings...
"Hello".class #=> String (object)

# ...and even methods!
"Hello".method(:class).class #=> Method

# Some basic arithmetic
1 + 1 #=> 2
8 - 1 #=> 7
10 * 2 #=> 20
35 / 5 #=> 7
2 ** 5 #=> 32
5 % 3 #=> 2

# Bitwise operators
3 & 5 #=> 1
3 | 5 #=> 7
3 ^ 5 #=> 6

# Arithmetic is just syntactic sugar
# for calling a method on an object
1.+(3) #=> 4
10.* 5 #=> 50
100.methods.include?(:/) #=> true

# Special values are objects
nil # equivalent to null in other languages
true # truth
false # falsehood

nil.class #=> NilClass
true.class #=> TrueClass
false.class #=> FalseClass

# Equality
1 == 1 #=> true
2 == 1 #=> false

# Inequality
1 != 1 #=> false
2 != 1 #=> true

# Apart from false itself, nil is the only other 'falsey' value

!!nil   #=> false
!!false #=> false
!!0     #=> true
!!""    #=> true

# More comparisons
1 < 10 #=> true
1 > 10 #=> false
2 <= 2 #=> true
2 >= 2 #=> true

# Combined comparison operator (returns `1` when the first argument is greater,
# `-1` when the second argument is greater, and `0` otherwise)
1 <=> 10 #=> -1 (1 < 10)
10 <=> 1 #=> 1 (10 > 1)
1 <=> 1 #=> 0 (1 == 1)

# Logical operators
true && false #=> false
true || false #=> true

def do_something
  puts "I am walkin here!"
end

def do_something_else
  2 + 2 != 5
end

def log_error
  puts "Logging an error..."
end


# Logical operators
true && false #=> false
true || false #=> true

def do_something
  puts "I am walkin here!"
end

def do_something_else
  2 + 2 != 5
end

def log_error
  puts "Logging an error..."
end

#-------------------------------------------------------------------------------
# Step 1: Learning with CSV Data
#-------------------------------------------------------------------------------

require "csv"

# Load CSV data into an array of hashes (maps).
games_array = CSV.read(
  "max-board-games-v2024.04.08.csv",
  headers: true,
  header_converters: :symbol
).map(&:to_h)

first_game = games_array.first # get first game in games_array
puts "Accessing first game using []: #{first_game[:name]}"

# You can reverse an Array.
reversed_games = games_array.reverse
puts "First game after reversing: #{reversed_games.first[:name]}"
# Reverse the the reversed_games array in place!
reversed_games.reverse!
puts "First game after re-reversing in place: #{games_array.first[:name]}"

# Accessing the first game using the [] method
first_game = games_array.first

# A new game!
new_game = {
  name: "New Exciting Game",
  publisher: "New Publisher",
  year: 2025
}

# Add the game like this
games_array << new_game
# Or like this
games_array.push(new_game)

# Check if a specific game exists in the array
exists = games_array.any? { |game| game[:name] == "New Exciting Game" }
puts "New Exciting Game exists? #{exists}"


# Create a single hashmap for quick lookup by game name.
games_hash = games_array.map { |row| [row[:name], row] }.to_h

# String interpolation

placeholder = "use string interpolation"
puts "I can #{placeholder} to show the first game: #{first_game[:name]}"
#=> "I can use string interpolation to show the first game: Inventors of the South Tigris"

def games_loaded?(games_array, games_hash)
  puts "Checking if array and hash are loaded..."
  !games_array.empty? && !games_hash.empty?
end

def show_confirmation(first_game)
  puts "Success! Data loaded. First game: #{first_game[:name]}"
end

def log_error
  puts "Error: Data not loaded properly."
end

def always_false
  false
end

# `show_confirmation` only called if `games_loaded?` is true
games_loaded?(games_array, games_hash) and show_confirmation(first_game)
always_false or log_error


# More string interpolation...

# You can combine strings using `+`, demonstrating how to access game data.
def combine_strings_with_plus_sign(game)
  "The game " + game[:name] + " has a BGG rating of " + game[:bgg_rating].to_s
end

puts combine_strings_with_plus_sign(first_game)
#=> "The game Inventors of the South Tigris has a BGG rating of 7.9"

# ...or combine strings and operators to list game publishers
def combine_strings_and_operators(games)
  games.map { |g| g[:publisher] }.uniq.compact.join(" | ") * 1 # Just joining, no real multiplication
end

puts combine_strings_and_operators(games_array)
#=> "Garphill Games | Stonemeier"

# ...or append to string
def append_to_string(string, games_array)
  string << " and has a complex weight of " << games_array.first[:weight].to_s
end

puts append_to_string("The game #{games_array.first[:name]} is ranked #{games_array.first[:overall_rank]}", games_array)
#=> "The game Inventors of the South Tigris is ranked 10800 and has a complex weight of 4.13"

# Variables representing games and publishers
first_game_name = games_array.first[:name] #=> "Inventors of the South Tigris"
first_publisher = games_array.first[:publisher] #=> "Garphill Games"

# Note that assignment returns the value assigned. This means you 'can' do multiple assignment.
first_game, second_game = games_array[0..1]
puts first_game[:name], second_game[:name]
#=> Inventors of the South Tigris
#=> Scholars of the South Tigris

# Symbols for quick access to game attributes
:year.class #=> Symbol
:weight.class #=> Symbol

# Arrays can be dynamically created from the CSV data.
names_array = games_array.map { |g| g[:name] }
puts names_array.first #=> Inventors of the South Tigris
puts names_array.include?("Inventors of the South Tigris") #=> true

# Hashes for storing games by name.
names_hash = games_array.map { |g| [g[:name], g] }.to_h
puts names_hash["Inventors of the South Tigris"][:publisher] #=> "Garphill Games"



# Tip: Both Arrays and Hashes are Enumerable!
# They share a lot of useful methods such as each, map, count, and more.


# Assuming games_array and games_hash are loaded from the CSV as before

# Each game's name and BGG rating from the array
games_array.each do |game|
  puts "Game: #{game[:name]}, BGG Rating: #{game[:bgg_rating]}"
end

# Each game's name and publisher from the hash
games_hash.each do |name, game|
  puts "#{name} is published by #{game[:publisher]}"
end

# Using each_with_index to include the index
games_array.each_with_index do |game, index|
  puts "#{index + 1}: #{game[:name]} (#{game[:year]})"
end

# Conditionals with games_array
if games_array.any? { |game| game[:year].to_i == 2024 }
  puts "There are games from 2024 in the list."
elsif games_array.all? { |game| game[:year].to_i < 2024 }
  puts "All games are from before 2024."
else
  puts "Mixed years in the games list."
end

# Postfix-if notation to check for empty array/hash
puts "Games array is not empty." if !games_array.empty?
puts "Games hash is not empty." unless games_hash.empty?

# Looping with Enumerable to double each game's BGG rating (hypothetical example)
doubled_ratings = games_array.map { |game| game[:bgg_rating].to_f * 2 }
puts "Doubled BGG Ratings: #{doubled_ratings.join(", ")}"

# Use map with &:symbol for downcase example (applied differently here)
game_names_downcased = games_array.map { |game| game[:name].downcase }
puts "Game names downcased: #{game_names_downcased.join(", ")}"

# Use case construct to categorize a game based on its BGG Rating
bgg_rating = games_array.first[:bgg_rating].to_f

case bgg_rating
when 9..10
  puts "Outstanding game!"
when 8..8.9
  puts "Great game!"
when 7..7.9
  puts "Good game, worth playing."
when 6..6.9
  puts "Not bad, but not great either."
else
  puts "Might need to consider other games."
end

# Categorizing a game based on its weight
game_weight = games_array.first[:weight].to_f

case game_weight
when 4..5
  puts "Very complex game, not for the faint of heart."
when 3..3.9
  puts "Medium complexity, requires strategic thinking."
when 2..2.9
  puts "Lighter game, easy to get into."
else
  puts "Very light game, perfect for beginners."
end

begin
  # Simulate an operation that could fail, for example, accessing a nonexistent game
  game = games_hash.fetch("Nonexistent Game", nil)
  raise "GameNotFound" unless game
rescue => e
  puts "An error occurred: #{e}"
else
  puts "Found the game: #{game[:name]}"
ensure
  puts "This always runs, ensuring we don't end on a bad note."
end

def double_weight(weight)
  weight.to_f * 2
end

# Example of doubling the weight of the first game
puts "Original weight: #{games_array.first[:weight]}, Double weight: #{double_weight(games_array.first[:weight])}"

def sum_ratings(rating1, rating2)
  rating1.to_f + rating2.to_f
end

# Summing the BGG ratings of the first two games
puts "Sum of ratings: #{sum_ratings(games_array[0][:bgg_rating], games_array[1][:bgg_rating])}"

# Surrounding game names with a block
def surround_with_brackets
  puts "["
  yield
  puts "]"
end

surround_with_brackets { puts games_array.first[:name] }

# Using a Proc to list guests, in this case, game designers
def list_designers(games_array, &block)
  designers = games_array.map { |game| game[:designer] }.uniq.compact.join(", ")
  block.call(designers)
end

# Call the method and pass the games array and a block to output designers
list_designers(games_array) { |designers| puts "Game Designers: #{designers}" }

# Passing multiple games to a method using the splat operator
def list_games(*games)
  games.each { |game| puts "Game: #{game[:name]}" }
end

list_games(games_array[0], games_array[1])

# Using shorthand block syntax to uppercase game names
upcased_names = games_array.map { |game| game[:name].upcase }
puts "Uppercased Game Names: #{upcased_names.join(", ")}"

# Using reduce to sum up all BGG ratings (for illustration, converting to floats for operation)
total_rating = games_array.reduce(0) { |sum, game| sum + game[:bgg_rating].to_f }
puts "Total BGG Rating Sum: #{total_rating}"

# Destructure to get the first three games from the games array
first_game, second_game, third_game = games_array[0..2]
puts "First three games: #{first_game[:name]}, #{second_game[:name]}, #{third_game[:name]}"

# Use the splat operator to get an array of game names
game_names = games_array.map { |game| game[:name] }
first, second, *remaining = game_names
puts "First: #{first}, Second: #{second}, Remaining: #{remaining.join(", ")}"

# Define a method to display the top three games and count the remaining
def display_top_games(first, second, third, *others)
  puts "Top 3 Games: #{first}, #{second}, #{third}"
  puts "And there are #{others.size} other games in the list."
end

# Pass the game names using the splat operator
display_top_games(*game_names[0..5])

# Boolean method example: Checking if a game is "heavy"
def heavy?(weight)
  weight.to_f > 3.5
end

puts "Is #{first_game[:name]} heavy? #{heavy?(first_game[:weight])}"

# Destructive method example: Increase game weight (hypothetically)
def intensify_weight!(game)
  game[:weight] = (game[:weight].to_f + 0.5).round(2)
end

# Assuming game[:weight] is directly modifiable for the example
intensify_weight!(first_game)
puts "New weight of #{first_game[:name]}: #{first_game[:weight]}"

# Demonstrating non-destructive method: Upcasing game names
def upcase_game_name(game_name)
  game_name.upcase
end

# Destructive method: Upcasing game name in place
def upcase_game_name!(game_name)
  game_name.upcase!
end

temp_name = "Inventors of the South Tigris"
puts upcase_game_name(temp_name) #=> "INVENTORS OF THE SOUTH TIGRIS"
puts temp_name #=> "Inventors of the South Tigris" (unchanged)

upcase_game_name!(temp_name)
puts temp_name #=> "INVENTORS OF THE SOUTH TIGRIS" (changed)

class Game
  attr_accessor :name, :publisher, :bgg_rating, :year, :weight

  @@total_games = 0

  def initialize(name, publisher, bgg_rating, year, weight)
    @name = name
    @publisher = publisher
    @bgg_rating = bgg_rating
    @year = year
    @weight = weight
    @@total_games += 1
  end

  def self.total_games
    @@total_games
  end

  def display_details
    puts "Name: #{@name}, Publisher: #{@publisher}, BGG Rating: #{@bgg_rating}, Year: #{@year}, Weight: #{@weight}"
  end
end

class Publisher
  attr_accessor :name
  attr_reader :games

  def initialize(name)
    @name = name
    @games = []
  end

  def add_game(game)
    @games << game
  end

  def display_games
    puts "Games published by #{@name}:"
    @games.each { |game| puts game.name }
  end
end

# Instantiating Game objects
game1 = Game.new("Inventors of the South Tigris", "Garphill Games", 7.9, 2024, 4.13)
game2 = Game.new("Scholars of the South Tigris", "Garphill Games", 8.2, 2023, 3.98)

# Display game details
game1.display_details
game2.display_details

# Instantiating a Publisher object and adding games to it
publisher = Publisher.new("Garphill Games")
publisher.add_game(game1)
publisher.add_game(game2)

# Display games published by Garphill Games
publisher.display_games

# Display total number of games
puts "Total Games: #{Game.total_games}"

module Describable
  def describe
    "This is a Describable object."
  end
end

# Including Describable in a Game class
class Game
  include Describable

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Extending Describable in a Publisher class
class Publisher
  extend Describable
end

def game_describe
  game = Game.new("Inventors of the South Tigris")
  puts game.describe # Instance method from Describable
end

def publisher_describe
  puts Publisher.describe # Class method from Describable, thanks to extend
end

game_describe
publisher_describe

module BoardGameConcern
  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module ClassMethods
    def class_method_example
      puts "This is a class method in BoardGameConcern."
    end
  end

  module InstanceMethods
    def instance_method_example
      puts "This is an instance method in BoardGameConcern."
    end
  end
end

# Class that includes BoardGameConcern
class BoardGame
  include BoardGameConcern
end

BoardGame.class_method_example
board_game = BoardGame.new
board_game.instance_method_example
