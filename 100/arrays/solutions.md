## Question 1
### Answer:
```
arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number)
  puts "arr includes #{number}"
end

```

## Question 2
### Answer:
1.) returns 1

`arr =  [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]`

2.) returns [1, 2, 3]

`arr = [["b"], ["a", [1, 2, 3]]]`

## Question 3
### Answer:
`arr[1][0]`
or
`arr.last.first`

## Question 4
### Answer:
`NoMethodError: undefined method ``[]' for #<Enumerator: [15, 7, 18, 5, 12, 8, 5, 1]:index>`


## Question 5
### Answer:
e  
A  
nil

## Question 6
### Answer:
The error is caused by using a string as the index of the array, instead of an integer

## Question 7
### Answer:
```
arr = [1,2,3,4,5,6]
new_arr = arr.map { |i| i+2 }

p arr
p new_arr
```
