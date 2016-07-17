## Question 1
### Answer:
It would print out the original numbers array, since uniq is not mutating the array.

## Question 2
### Answer:
This is used for "not equal".  
Gives the opposite of it's boolean value  
This is typically a part of a method name and will mutate the object  
Should be seen with the ternary operator  
This is typically a part of a method name and will return a boolean value  
This would give the boolean value of an object

## Question 3
### Answer:
`advice.sub!('important', 'urgent')`

## Question 4
### Answer:
The first method deletes the value at the specified index, while the second method deletes all values found matching the input.


## Question 5
### Answer:
`(10..100).cover?(42)`


## Question 6
### Answer:
```
famous_words = "seven years ago..."
puts "Four score and #{famous_words}"
puts "Four score and ".concat(famous_words)
puts "Four score and " << famous_words
puts famous_words.prepend("Four score and ")
```

## Question 7
### Answer:
42

## Question 8
### Answer:
`flintstones.flatten!`


## Question 9
### Answer:
`flintstones.assoc('Barney')`

## Question 10
### Answer:
```
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
```
