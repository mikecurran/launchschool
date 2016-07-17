## Question 1
### Answer:
```
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |num| puts num }
```

## Question 2
### Answer:
```
arr.each do |num|
  if num > 5
    puts num
  end
end
```

## Question 3
### Answer:
```
new_arr = arr.select do |num|
  num.odd?
end
```

## Question 4
### Answer:
```
arr << 11
arr.unshift(0)
```

## Question 5
### Answer:
```
arr.pop
arr << 3
```

## Question 6
### Answer
`arr.uniq!`

## Question 7
### Answer:
An array is basically an indexed list, while a hash contains key/values.

## Question 8
### Answer:
```
hash = {:name => "Jack"}
hash = {name: "Jack"}
```

## Question 9
### Answer:
```
h = {a:1, b:2, c:3, d:4}

h[:b]
h[:e] = 5
h.delete_if do |k, v|
  v < 3.5
end
```

## Question 10
### Answer:
Yes

## Question 11
### Answer:
The ruby-docs are great for finding and referencing the classes and instance methods, etc.

## Question 12
### Answer:
```
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]
```

## Question 13
### Answer:
```
puts "This is Joe's email: #{contacts["Joe Smith"][:email]}"
puts "This is Sally's phone number: #{contacts["Sally Johnson"][:phone]}"
```

## Question 14
### Answer:
```
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end
```

## Question 15
### Answer:
```
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?("s") }

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?("s", "w") }
```

## Question 16
```
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a = a.map { |words| words.split }
a = a.flatten
p a
```

## Question 17
### Answer:
These hashes are the same!
