#!/usr/bin/env ruby
DEALER_LIMIT = 17
GAME_LIMIT = 21
ROUNDS = 5
SUITS = %w(Hearts Diamonds Spades Clubs).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
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

  initial_ace_adjustment(values, sum)
end

def initial_ace_adjustment(values, sum)
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

  aces += 1 if value == 'Ace'
  running_ace_adjustment(sum, aces)
end

def running_ace_adjustment(sum, aces)
  if sum > GAME_LIMIT && aces > 0
    aces.times do
      sum -= 10
      aces -= 1
    end
  end
  [sum, aces]
end

def detect_result(dealer_total, player_total)
  if player_total > GAME_LIMIT then :player_busted
  elsif dealer_total > GAME_LIMIT then :dealer_busted
  elsif dealer_total < player_total then :player
  elsif dealer_total > player_total then :dealer
  else :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted then prompt 'You busted! Dealer wins this round!'
  when :dealer_busted then prompt 'Dealer busted! You win this round!'
  when :player then prompt 'You win this round!'
  when :dealer then prompt 'Dealer wins this round!'
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

def display_game_winner(final_score)
  final_score.each do |player, score|
    if score == ROUNDS && player == :player
      prompt 'You won the game!'
    elsif score == ROUNDS && player == :dealer
      prompt 'The dealer won the game!'
    end
  end
end

def busted?(total)
  total > GAME_LIMIT
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
  score = { player: 0, dealer: 0, tie: 0 }
  clear_screen

  loop do
    deck = initialize_deck

    dealer_cards = get_cards(deck, 2)
    player_cards = get_cards(deck, 2)
    dealer_total, dealer_aces = initial_total(dealer_cards)
    player_total, player_aces = initial_total(player_cards)
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
        player_total, player_aces = running_total(player_cards.last,
                                                  player_total, player_aces)
        prompt 'You chose to hit!'
        prompt "Your cards are now: #{join_cards(player_cards)}"
        prompt "Your total is now: #{player_total}"
      end

      break if player_turn == 's'
    end

    unless busted?(player_total)
      prompt "Dealer's turn..."

      until dealer_total >= DEALER_LIMIT
        prompt 'Dealer hits!'
        dealer_cards << get_cards(deck)
        dealer_total, dealer_aces = running_total(dealer_cards.last,
                                                  dealer_total, dealer_aces)
        prompt "Dealer's cards are now: #{join_cards(dealer_cards)}"
      end
    end

    result = detect_result(dealer_total, player_total)
    track_score(result, score)
    show_round_results(dealer_cards, dealer_total, player_cards, player_total)

    prompt 'Press enter to continue...'
    gets
    clear_screen

    break display_game_winner(score) if score.value?(ROUNDS)
  end

  prompt 'Do you want to play again? (y or n)'
  break unless play_again?
end

prompt 'Thank you for playing Twenty-One.  Good bye!'
