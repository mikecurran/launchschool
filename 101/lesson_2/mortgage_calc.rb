#!/usr/bin/env ruby
require 'yaml'

MESSAGES = YAML.load_file('mc_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def display_message(selection, format = '')
  if MESSAGES[selection].is_a? Hash
    MESSAGES[selection].each_value { |message| prompt message }
  elsif format.empty?
    prompt MESSAGES[selection]
  else
    prompt MESSAGES[selection] + format
  end
end

def valid_number?(num)
  /^[1-9](\d+)?([.]\d{1,2})?$/.match(num)
end

def valid_apr?(num)
  /^[1-9]\d?([.]\d{1,2})?$/.match(num) ||
    /^\d{1,2}[.]\d[1-9]$/.match(num) ||
    num == '100'
end

def valid_year?(num)
  /^\d+$/.match(num)
end

def another_calculation?
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt "Please enter 'y' or 'n'"
  end
end

def valid_item(item, answer)
  if item == 'amount'
    valid_number?(answer)
  elsif item == 'apr'
    valid_apr?(answer)
  else
    valid_year?(answer)
  end
end

display_message('greeting')

answers = { amount: '', apr: '', duration: '' }
loop do
  %w(amount apr duration).each do |item|
    loop do
      display_message(item)
      answer = gets.chomp

      if valid_item(item, answer)
        answers[item.to_sym] = answer
        break
      end
    end
  end

  months = answers[:duration].to_i * 12

  annual_rate = answers[:apr].to_f / 100
  monthly_rate = annual_rate / 12

  monthly_payment = answers[:amount].to_f *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**-months.to_i))

  format_payment = format('%02.2f', monthly_payment)
  display_message('payment', format_payment)

  display_message('again')
  break unless another_calculation?
end

display_message('bye')
