#!/usr/bin/env ruby

# 1
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

puts ""


# 2
puts "merge returns a new hash of the two hashes, whereas merge! actually updates the second hash into the first hash"

h1 = {name: 'Bob'}
h2 = {age: '99'}

puts h1.merge(h2)
puts h1
puts h2

puts h1.merge!(h2)
puts h1
puts h2

puts ""


# 3
h = {name: 'Bob', age: '99', city: 'Chicaco'}
h.each_key { |k| puts k }
h.each_value { |v| puts v }
h.each { |k,v| puts "#{k} is #{v}" }

puts ""


# 4
puts "person[:name]"

puts ""


# 5 
h = {name: 'Bob', age: '99', city: 'Chicaco'}

puts "the has_value? method"

puts "The hash includes the value" if h.has_value?('Bob')

puts ""


# 6 
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

puts ""


# 7
puts "The first hash was created using a symbol, the second with a variables"

puts ""


# 8
puts "B"
