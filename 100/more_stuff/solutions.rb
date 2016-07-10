#!/usr/bin/env ruby

# 1
a = [ "laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear" ]

a.each do |word|
  if /lab/ =~ word
    puts word
  else
    puts "Didn't match"
  end
end
puts ""


# 2
puts "Nothing, it returns a proc object"
puts ""


# 3
puts "Exception handling is a specific process that deals with errors in a manageable and predictable way.  It provides a way of handling the error within the code without the programming stopping at that error"
puts ""


# 4
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
puts ""


# 5
puts "We're trying to pass in a block, but the method is missing the & in front of the block parameter"
