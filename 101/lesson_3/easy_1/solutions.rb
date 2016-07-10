#!/usr/bin/env ruby

# 1
puts "1:"
puts "It would print out the original numbers array, since uniq is not mutating the array."
puts "\n\n"


# 2
puts "2:"
puts 'This is used for "not equal".'
puts "Gives the opposite of it's boolean value"
puts "This is typically a part of a method name and will mutate the object"
puts "Should be seen with the ternary operator"
puts "This is typically a part of a method name and will return a boolean value"
puts "This would give the boolean value of an object"
puts "\n\n"


# 3
puts "3:"
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')
puts advice
puts "\n\n"


# 4
puts "4:"
puts "The first method deletes the value at the specified index, while the second method deletes all values found matching the input."
puts "\n\n"


# 5
puts "5:"
puts (10..100).cover?(42)
puts "\n\n"


# 6
puts "6:"
famous_words = "seven years ago..."
puts "Four score and #{famous_words}"
puts "Four score and ".concat(famous_words)
puts "Four score and " << famous_words
puts famous_words.prepend("Four score and ")
puts "\n\n"


# 7
puts "7:"
puts "42"
puts "\n\n"


# 8
puts "8:"
puts "flinstones.flatten!"
puts "\n\n"


# 9
puts "9:"
puts "flintstones.assoc('Barney')"
puts "\n\n"


# 10
puts "10:"
puts "flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end"
