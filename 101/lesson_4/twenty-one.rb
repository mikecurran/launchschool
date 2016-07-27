#!/usr/bin/env ruby
require 'pry'
SUITS = %w(Hearts Diamonds Spades Clubs).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def get_cards(deck, num = 1)
  num == 1 ? deck.shift : deck.shift(num)
end

def join_cards(cards)
  cards = cards.map { |card, suit| "#{card} of #{suit}" }
  cards[-1] = "and #{cards.last}" if cards.size > 1
  cards.size == 2 ? cards.join(' ') : cards.join(', ')
end

# rubocop:disable Metrics/MethodLength
def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    sum = if value == 'Ace'
            sum + 11
          elsif value.to_i == 0 # J, Q, K
            sum + 10
          else
            sum + value.to_i
          end
  end

  calculate_aces(values, sum)
end

def calculate_aces(values, sum)
  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt 'You busted! Dealer wins!'
  when :dealer_busted
    prompt 'Dealer busted! You win!'
  when :player
    prompt 'You win!'
  when :dealer
    prompt 'Dealer wins!'
  when :tie
    prompt "It's a tie!"
  end
end
# rubocop:enable Metrics/MethodLength

def busted?(cards)
  total(cards) > 21
end

def play_again?
  loop do
    answer = gets.chomp.downcase
    return true if %w(y yes).include?(answer)
    return false if %w(n no).include?(answer)
    prompt "Please enter 'y' or 'n'"
  end
end

loop do
  deck = initialize_deck

  dealer_busted = false
  player_busted = false
  player_cards = get_cards(deck, 2)
  dealer_cards = get_cards(deck, 2)

  prompt "Dealer has: #{dealer_cards[0][0]} " \
         "of #{dealer_cards[0][1]} and unknown card"
  prompt "You have: #{join_cards(player_cards)}, " \
         "for a total of #{total(player_cards)}"

  loop do
    break player_busted = true if busted?(player_cards)
    player_turn = nil
    loop do
      prompt 'Would you like to (h)it or (s)tay?'
      player_turn = gets.chomp.downcase
      break if %w(h s).include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << get_cards(deck)
      prompt 'You chose to hit!'
      prompt "Your cards are now: #{join_cards(player_cards)}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's'
  end

  if player_busted
    display_result(dealer_cards, player_cards)
    prompt 'Do you want to play again? (y or n)'
    play_again? ? next : break
  end

  prompt "Dealer's turn..."

  loop do
    break dealer_busted = true if busted?(dealer_cards)
    break if player_busted || total(dealer_cards) >= 17

    prompt 'Dealer hits!'
    dealer_cards << get_cards(deck)
    prompt "Dealer's cards are now: #{join_cards(dealer_cards)}"
  end

  if dealer_busted
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    prompt 'Do you want to play again? (y or n)'
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  puts '=============='
  prompt "Dealer has #{join_cards(dealer_cards)}, " \
         "for a total of: #{total(dealer_cards)}"
  prompt "Player has #{join_cards(player_cards)}, " \
         "for a total of: #{total(player_cards)}"
  puts '=============='

  display_result(dealer_cards, player_cards)

  prompt 'Do you want to play again? (y or n)'
  break unless play_again?
end

prompt 'Thank you for playing Twenty-One.  Good bye!'
