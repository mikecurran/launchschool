#!/usr/bin/env ruby
SUITS = %w(Hearts Diamonds Spades Clubs).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
LIMIT = 21

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def get_cards(deck, num = nil)
  num.nil? ? deck.shift : deck.shift(num)
end

def join_cards(cards)
  cards = cards.map { |card, suit| "#{card} of #{suit}" }
  cards[-1] = "and #{cards.last}" if cards.size > 1
  cards.size == 2 ? cards.join(' ') : cards.join(', ')
end

def initial_total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    sum += if value == 'Ace' then 11
           elsif value.to_i == 0 then 10 # J, Q, K
           else value.to_i
           end
  end

  sum -= 10 if sum == 22
  aces = values.select { |value| value == 'Ace' }.count > 0 ? 1 : 0
  [sum, aces]
end

def running_total(card, sum, aces)
  value = card[0]
  sum += if value == 'Ace' then 11
         elsif value.to_i == 0 then 10 # J, Q, K
         else value.to_i
         end

  aces.times { sum -= 10 if sum > LIMIT } if value == 'Ace'

  if aces > 0
    aces.times { sum -= 10 if sum > LIMIT }
    aces -= 1
  end
  [sum, aces]
end

def detect_result(dealer_total, player_total)
  if player_total > LIMIT then :player_busted
  elsif dealer_total > LIMIT then :dealer_busted
  elsif dealer_total < player_total then :player
  elsif dealer_total > player_total then :dealer
  else :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted then prompt 'You busted! Dealer wins!'
  when :dealer_busted then prompt 'Dealer busted! You win!'
  when :player then prompt 'You win!'
  when :dealer then prompt 'Dealer wins!'
  when :tie then prompt "It's a tie!"
  end
end

def track_score(result, score)
  if result == :player || result == :dealer_busted
    score[:player] += 1
  elsif result == :dealer || result == :player_busted
    score[:dealer] += 1
  else
    score[:tie] += 1
  end
end

def display_score(score)
  prompt "The score is Player: [#{score[:player]}], " \
          "Dealer: [#{score[:dealer]}], " \
          "Ties: [#{score[:tie]}]"
end

def show_round_results(dealer_cards, dealer_total, player_cards, player_total)
  puts '=============='
  prompt "Dealer has #{join_cards(dealer_cards)}, " \
         "for a total of: #{dealer_total}"
  prompt "Player has #{join_cards(player_cards)}, " \
         "for a total of: #{player_total}"
  puts '=============='
  display_result(dealer_total, player_total)
end

def busted?(total)
  total > LIMIT
end

def play_again?
  loop do
    answer = gets.chomp.downcase
    return true if %w(y yes).include?(answer)
    return false if %w(n no).include?(answer)
    prompt "Please enter 'y' or 'n'"
  end
end

score = { player: 0, dealer: 0, tie: 0 }
loop do
  deck = initialize_deck

  dealer_cards = get_cards(deck, 2)
  player_cards = get_cards(deck, 2)
  dealer_total, dealer_total_aces = initial_total(dealer_cards)
  player_total, player_total_aces = initial_total(player_cards)

  display_score(score)

  prompt "Dealer has: #{dealer_cards[0][0]} " \
         "of #{dealer_cards[0][1]} and unknown card"
  prompt "You have: #{join_cards(player_cards)}, " \
         "for a total of #{player_total}"

  loop do
    break if busted?(player_total)
    player_turn = nil

    loop do
      prompt 'Would you like to (h)it or (s)tay?'
      player_turn = gets.chomp.downcase
      break if %w(h s).include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << get_cards(deck)
      player_total, player_total_aces = running_total(player_cards.last,
                                                      player_total,
                                                      player_total_aces)
      prompt 'You chose to hit!'
      prompt "Your cards are now: #{join_cards(player_cards)}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's'
  end

  if busted?(player_total)
    show_round_results(dealer_cards, dealer_total, player_cards, player_total)
    result = detect_result(dealer_total, player_total)
    track_score(result, score)
    prompt 'Do you want to play again? (y or n)'
    play_again? ? next : break
  end

  prompt "Dealer's turn..."

  until dealer_total >= 17
    prompt 'Dealer hits!'
    dealer_cards << get_cards(deck)
    dealer_total, dealer_total_aces = running_total(dealer_cards.last,
                                                    dealer_total,
                                                    dealer_total_aces)
    prompt "Dealer's cards are now: #{join_cards(dealer_cards)}"
  end

  if busted?(dealer_total)
    show_round_results(dealer_cards, dealer_total, player_cards, player_total)
    result = detect_result(dealer_total, player_total)
    track_score(result, score)
    prompt 'Do you want to play again? (y or n)'
    play_again? ? next : break
  end

  result = detect_result(dealer_total, player_total)
  track_score(result, score)

  show_round_results(dealer_cards, dealer_total, player_cards, player_total)
  prompt 'Do you want to play again? (y or n)'
  break unless play_again?
end

prompt 'Thank you for playing Twenty-One.  Good bye!'
