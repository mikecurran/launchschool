#!/usr/bin/env ruby

# 1
puts '1:'
puts "In this case, greeting should be nil, because even though the if statement didn't execute, the variable was still initalized"
puts "\n\n"


# 2
puts '2:'
puts 'This will return {:a=>"hi there"}, because the String#<< method is mutating the original object.'


# 3
puts '3:'
puts "Code set A won't modify the variables in the outer scope.  The method assignments will result in new objects, so it will still be one, two and three."
puts "Code set B also won't modify the variables, for the same reason as code set A"
puts 'Code set C will modify the origin objects, because gsub will mutate the original object.  It will now be two, three, one'


# 4
puts '4:'
def generate_UUID
  characters = [] 
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

puts generate_UUID
puts "\n\n"


# 5
puts '5:'
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end
