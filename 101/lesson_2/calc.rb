#!/usr/bin/env ruby
# Simple calculator program

# Define our message prompt
def prompt(message)
  puts "=> #{message}"
end

# Check if a number is valid
def valid_number?(num)
  /\d/.match(num)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# Welcome message
prompt "Welcome to the calculator! Please enter your name:"

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure you use a valid name."
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  # Ask the user for two numbers
  first = ''
  loop do
    prompt "What's the first number?"
    first = gets.chomp

    if valid_number?(first)
      break
    else
      prompt "Hmm... that doesn't look like a valid number."
    end
  end

  second = ''
  loop do
    prompt "What's the second number?"
    second = gets.chomp

    if valid_number?(second)
      break
    else
      prompt "Hmm... that doesn't look like a valid number."
    end
  end

  # Ask the user for an operation to perform
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3, or 4"
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  # Perform that operation
  result = case operator
           when '1'
             first.to_i + second.to_i
           when '2'
             first.to_i - second.to_i
           when '3'
             first.to_i * second.to_i
           when '4'
             first.to_f / second.to_f
           end

  # Output the results
  prompt "The result is #{result}"

  prompt "Do you want to perform another calculation? (Y to calcaulate again)"
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using the calculator.  Good bye!"
