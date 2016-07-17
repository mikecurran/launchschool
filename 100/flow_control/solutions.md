## Question 1
### Answer:
1. false
2. false 
3. false 
4. true 
5. true 

## Question 2
### Answer:
```
hey = "hello world"
yo = "yo!"

def word_caps(word)
  if word.length > 10
    word.upcase
  else
    word
  end
end

puts word_caps(hey)
puts word_caps(yo)
```

## Question 3
### Answer:
```
puts "Please enter a number between 0 and 100"
num = gets.chomp.to_i

if num < 0
  puts "#{num} is negative"
elsif num <= 50
  puts "#{num} is in the 0 to 50 range"
elsif num <= 100
  puts "#{num} is in the 51 to 100 range"
else
  puts "#{num} is greater than 100"
end
```

## Question 4
### Answer:
1. FALSE
2. Did you get it right?
Alright now!

## Question 5
### Answer:
```
puts "Please enter a number between 0 and 100"
num = gets.chomp.to_i

def if_num(num)
  if num < 0
    puts "#{num} is negative"
  elsif num <= 50
    puts "#{num} is in the 0 to 50 range"
  elsif num <= 100
    puts "#{num} is in the 51 to 100 range"
  else
    puts "#{num} is greater than 100"
  end
end

def case_num(num)
  case
  when num < 0
    puts "#{num} is negative"
  when num <= 50
    puts "#{num} is in the 0 to 50 range"
  when num <= 100
    puts "#{num} is in the 51 to 100 range"
  else
    puts "#{num} is greater than 100"
  end
end

if_num(num)
case_num(num)
```

## Question 6
### Answer:
There is only one end, but should be two for the method and the if statement.
