## Question 1
### Answer:
```
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end

arr = immediate_family.values.flatten

p arr
```

## Question 2
### Answer:
merge returns a new hash of the two hashes, whereas merge! actually updates the second hash into the first hash

```
h1 = {name: 'Bob'}
h2 = {age: '99'}

puts h1.merge(h2)
puts h1
puts h2

puts h1.merge!(h2)
puts h1
puts h2
```

## Question 3
### Answer:
```
h = {name: 'Bob', age: '99', city: 'Chicaco'}
h.each_key { |k| puts k }
h.each_value { |v| puts v }
h.each { |k,v| puts "#{k} is #{v}" }
```

## Question 4
### Answer:
`person[:name]`

## Question 5
### Answer:
The has_value? method

``` 
h = {name: 'Bob', age: '99', city: 'Chicaco'}

puts "The hash includes the value Bob" if h.has_value?('Bob')
```

## Question 6
### Answer: 
```
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

groups = {}

words.each do |word|
  sorted = word.chars.sort.join

  if groups.has_key?(sorted)
    groups[sorted] << word
  else
    groups[sorted] = [word]
  end
end

groups.each { |k,v| p v }
```

## Question 7
### Answer:
The first hash was created using a symbol, the second with a variables

## Question 8
### Answer:
B
