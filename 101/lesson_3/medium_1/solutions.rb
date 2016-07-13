#!/usr/bin/env ruby

# 1
puts '1:'
10.times { |number| puts ' ' * number + 'The Flintstones Rock!' }
puts "\n\n"


# 2
puts '2:'
puts 'Here are two solutions:'
puts ""
puts 'statement = "The Flintstones Rock"'

puts '
frequency = {}
statement.each_char do |letter|             
 if frequency.include?(letter)         
   frequency[letter] = frequency[letter] + 1
 elsif letter == ' '
 else
   frequency[letter] = 1
 end
end'

puts "
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end"
puts "\n\n"


# 3
puts '3:'
puts 'This is an error because of trying to concatenate a string with an integer.  The integer needs .to_s or to be interpolated into the string properly with #{40 +2}'
puts "\n\n"


# 4
puts '4:'
puts 'The first iteration will output 1 and 3, the second will output 1 and 2.  This is due to the iteration running the operations (shift or pop) on the array, not a copy of it.  So, for example, in the first iteration of the array [1,2,3,4], the .each method will start with the value at index 0, which is 1, then .shift(1) will remove that value, leaving us with an array of [2 3 4], and so now .each will be looking for index 1, which is now 3, .shift(1) will remove the 2, leaving us with 3 and 4, and so .each stops as there is no longer a third index.'
puts "\n\n"


# 5
puts '5:'
puts 'Using while:  
while dividend > 0 do
  divisors << number / dividend if number % dividend == 0
  dividend -= 1
end'
puts 'Bonus 1: The modulus operator performs a division and returns the remainders, if any, so == 0 checks to make sure there are no remainders'
puts 'Bonus 2: It is the return value'
puts "\n\n"


# 6
puts '6:'
puts 'There is a difference between the two methods.  While they will both have the same return value, the first will end up modifying the original array being passed in, while the second will not'
puts "\n\n"


# 7
puts '7:'
puts 'The limit variable is not in the scope of the method.  It could be made to be passed in to the method, or set as a global constant.'
puts "\n\n"


# 8
puts '8:'
puts 'words.split.map { |word| word.capitalize }.join(' ')'
puts "\n\n"


# 9
puts '9:'
puts 'munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end'
