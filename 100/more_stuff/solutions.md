## Question 1
### Answer:
```
a = [ "laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear" ]

a.each do |word|
  if /lab/ =~ word
    puts word
  else
    puts "Didn't match"
  end
end
```

## Question 2
### Answer:
Nothing, it returns a proc object

## Question 3
### Answer:
Exception handling is a specific process that deals with errors in a manageable and predictable way.  It provides a way of handling the error within the code without the programming stopping at that error

## Question 4
### Answer:
```
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
```

## Question 5
### Answer:
We're trying to pass in a block, but the method is missing the & in front of the block parameter
