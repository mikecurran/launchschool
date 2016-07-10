#!/usr/bin/env ruby

# 1
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |num| puts num }

puts ""


# 2
arr.each do |num|
  if num > 5
    puts num
  end
end

puts ""


# 3
new_arr = arr.select do |num|
  num.odd?
end


# 4
arr << 11
arr.unshift(0)


# 5
arr.pop
arr << 3


# 6
arr.uniq!


# 7
puts "An array is basically an indexed list, while a hash contains key/values."

puts ""


# 8
hash = {:name => "Jack"}
hash = {name: "Jack"}


# 9
h = {a:1, b:2, c:3, d:4}

puts "1. h[:b]"
puts "2. h[:e] = 5"
puts "3. h.delete_if do |k, v|"
puts "     v < 3.5"
puts "   end"

puts ""


# 10
puts "Yes"

puts ""


# 11
puts "The ruby-docs are great for finding and referencing the classes and instance methods, etc."

puts ""


# 12
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]


# 13
puts "This is Joe's email: #{contacts["Joe Smith"][:email]}"
puts "This is Sally's phone number: #{contacts["Sally Johnson"][:phone]}"

puts ""


# 14
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end


puts ""


# 15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?("s") }

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?("s", "w") }


# 16
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a = a.map { |words| words.split }
a = a.flatten
p a


puts ""


# 17
puts "These hashes are the same!"
