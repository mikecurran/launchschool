## Question 1
### Answer:
```
puts "Please enter your name." 
name = gets.chomp
puts "Hi there, #{name}"
```

## Question 2
### Answer:
```
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
```

## Question 3
### Answer:
```
10.times do 
  puts name
end
```

## Question 4
### Answer:
```
puts "Please enter your first name."
first_name = gets.chomp
puts "Please enter your last name."
last_name = gets.chomp
puts "Hi there, #{first_name + " " + last_name}"
```

## Question 5
### Answer:
In the first example x prints 3  
In the second, x gives an error because it cannot access the variable, as it is in the outer scope and the variable was initialized in the inner scope of the times method  
The error it gave is: NameError: undefined local variable or method `x' for main:Object


## Question 6
### Answer:
It looks like the program is trying to call a variable or method on line 3 that is undefined or that was created in a scope it cannot access
