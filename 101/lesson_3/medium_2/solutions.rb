#!/usr/bin/env ruby

# 1
puts '1:'
puts 'total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end'
puts "\n\n"


# 2
puts '2:'
puts 'munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
end'
puts "\n\n"


# 3
puts '3:'
puts 'def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"'
puts "\n\n"


# 4
puts '4:'
puts 'sentence.split(/\W/).reverse.join(" ") + "."'
puts "\n\n"


# 5
puts '5:'
puts '34'
puts "\n\n"


# 6
puts '6:'
puts 'It got mangled.  The data in the hash is mutated when passed to the method.'
puts "\n\n"


# 7
puts '7:'
puts 'paper'
puts "\n\n"


# 8
puts '8:'
puts 'no'
puts "\n\n"
