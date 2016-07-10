#!/usr/bin/env ruby

# 1
puts "Please enter your name." 
name = gets.chomp
puts "Hi there, #{name}"


# 2
puts "Please enter your age." 
age = gets.chomp.to_i
puts "In 10 years you will be: "
puts age + 10
puts "In 20 years you will be: "
puts age + 20
puts "In 30 years you will be: " 
puts age + 30
puts "In 40 years you will be: " 
puts age + 40


# 3
10.times do 
  puts name
end


# 4
puts "Please enter your first name."
first_name = gets.chomp
puts "Please enter your last name."
last_name = gets.chomp
puts "Hi there, #{first_name + " " + last_name}"


# 5 
puts "In the first example x prints 3"
puts "In the second, x gives an error because it cannot access the variable, as it is in the outer scope and the variable was initialized in the inner scope of the times method"
puts "The error it gave is: NameError: undefined local variable or method `x' for main:Object"


# 6
puts "It looks like the program is trying to call a variable or method on line 3 that is undefined or that was created in a scope it cannot access"
