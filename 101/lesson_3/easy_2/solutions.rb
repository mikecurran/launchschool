#!/usr/bin/env ruby

# 1
puts '1:'
puts 'ages.key?("Spot")'
puts 'You could also use .include? and .member?'
puts "\n\n"


# 2
puts '2:'
puts 'ages.values.inject(:+)'
puts "\n\n"


# 3
puts '3:'
puts 'ages.keep_if { |name, age| age < 100 }' 
puts "\n\n"


# 4
puts '4:'
puts 'munsters_description.capitalize!'
puts 'munsters_decription.swapcase!'
puts 'munsters_description.downcase!'
puts 'munsters_description.upcase!'
puts "\n\n"


# 5
puts '5:'
puts 'ages.merge!(additional_ages)'
puts "\n\n"


# 6
puts '6:'
puts 'ages.values.min'
puts "\n\n"


# 7
puts '7:'
puts 'advice.match("dino")'
puts "\n\n"


# 8
puts '8:'
puts 'flintstones.index { |name| name[0, 2] == "Be" }'
puts "\n\n"


# 9
puts '9:'
puts '
flintstones.map! do |name|
  name[0, 3]
end'
puts "\n\n"


# 10
puts '10:'
puts 'flintstones.map! { |name| name[0,3] }'
