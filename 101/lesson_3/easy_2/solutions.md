## Question 1
### Answer:
`ages.key?("Spot")`

You could also use .include? and .member?


## Question 2
### Answer:
`ages.values.inject(:+)`

## Question 3
### Answer:
`ages.keep_if { |name, age| age < 100 }`

## Question 4
### Answer:
`munsters_description.capitalize!`  
`munsters_decription.swapcase!`  
`munsters_description.downcase!`  
`munsters_description.upcase!`

## Question 5
### Answer:
`ages.merge!(additional_ages)`

## Question 6
### Answer:
`ages.values.min`

## Question 7
### Answer:
`advice.match("dino")`

## Question 8
### Answer:
`flintstones.index { |name| name[0, 2] == "Be" }`

## Question 9
### Answer:
```
flintstones.map! do |name|
  name[0, 3]
end
```

## Question 10
### Answer:
`flintstones.map! { |name| name[0,3] }`
