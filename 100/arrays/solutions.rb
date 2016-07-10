#!/usr/bin/env ruby

# 1
arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number)
  puts "arr includes #{number}"
end

puts ""


# 2
puts "1. returns 1"
puts 'arr =  [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]'

puts "2. returns [1, 2, 3]"
puts 'arr = [["b"], ["a", [1, 2, 3]]]'

puts ""


# 3
puts "puts arr[1][0]"
puts "or"
puts "arr.last.first"

puts ""


# 4
puts "3"
puts "NoMethodError: undefined method `[]' for #<Enumerator: [15, 7, 18, 5, 12, 8, 5, 1]:index>"
puts "8"

puts ""


# 5
puts "e"
puts "A"
puts "nil"

puts ""


# 6
puts "the error is caused by using a string as the index of the array, instead of an integer"

puts ""


# 7
arr = [1,2,3,4,5,6]

new_arr = arr.map { |i| i+2 }

p arr
p new_arr
