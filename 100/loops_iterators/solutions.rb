#!/usr/bin/env ruby

# 1
puts "It returns the original array, [1,2,3,4,5]"

puts ""


# 2
s = ""
while s != "STOP" do
  puts "Enter a number"
  num = gets.chomp.to_i
  puts "You entered #{num}"

  puts "Press any key to continue or type STOP to stop"
  s = gets.chomp
end
puts ""


# 3
a = %w(bob jack bill steve jason)

a.each_with_index { |obj,i| puts "Index #{i} => #{obj}" }
puts ""


# 4 
def zero(num)
  unless num < 0
    puts num
    zero(num-1)
  end
end

zero(10)
puts ""
