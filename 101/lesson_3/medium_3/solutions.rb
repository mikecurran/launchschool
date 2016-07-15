#!/usr/bin/env ruby

# 1
puts '1:'
puts "The object_id's will be the same when two values are the same, since under the hood ruby is reusing the object, and this should be true whether in a block or not.  When reassigned the object_id's will change, because new objects are being created"
puts "\n\n"


# 2
puts '2:'
puts "The values passed into a method will use the same object_id, because the values remain the same while being passed into the method.  Changing them inside the method will change the object_id for the variables inside the method, separate from the outer scope, and will retain the same object_id's outside the method."
puts "\n\n"


# 3
puts '3:'
puts "The string outside the array will remain unchanged, because it's not being mutated; it is being reassigned (creating a new String object (has a new object_id)).  The array is being mutated by the << operator (reference to the same object), and so will show as changed outside the method."
puts "\n\n"


# 4
puts '4:'
puts "This time the results will be reversed, because gsub! will mutate the original object, while the array assignment will create a copy of the original array"
puts "\n\n"


# 5
puts '5:'
puts 'def color_valid(color)
  color == "blue" || color == "green"
end'

