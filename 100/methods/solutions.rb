#!/usr/bin/env ruby

# 1
def greeting(name)
  "Hi there, #{name}"
end

puts greeting("Bill")

puts ""

# 2
puts "To the integer 2"
puts "To nil"
puts "To the string Joe"
puts "To the string four"
puts "To nil"

puts ""

# 3
def multiply(a,b)
  a * b
end

puts multiply(4,5)

puts ""

# 4
puts "Nothing, because it returns nil"

puts ""

# 5
def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")

puts "And it still returns nil for now"

puts ""

# 6
puts "That the method calculate_product requires 2 arguments, and only 1 is being passed to it"
