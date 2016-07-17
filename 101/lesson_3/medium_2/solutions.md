## Question 1
### Answer:
```
total_male_age = 0

munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end
```

## Question 2
### Answer:
```
munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
end
```

## Question 3
### Answer:
```
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"'
```

## Question 4
### Answer:
`sentence.split(/\W/).reverse.join(" ") + "."`

## Question 5
### Answer:
34

## Question 6
### Answer:
It got mangled.  The data in the hash is mutated when passed to the method.

## Question 7
### Answer:
paper

## Question 8
### Answer:
no
