#!/usr/bin/env ruby

ROUNDS = 5

CHOICES = {
  r: { name: 'rock', defeats: %w(l s) },
  p: { name: 'paper', defeats: %w(r v) },
  s: { name: 'scissors', defeats: %w(p l) },
  l: { name: 'lizard', defeats: %w(v p) },
  v: { name: 'spock', defeats: %w(s r) }
}.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def display_choices
  CHOICES.keys.each do |key|
    prompt "[#{key}] for #{CHOICES[key][:name]}"
  end
end

def win?(first, second)
  CHOICES[first.to_sym][:defeats].include?(second)
end

def round_result(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'tie'
  end
end

def clear_screen
  (system "clear") || (system "cls")
end

def display_results(result, score)
  if result == 'player'
    prompt 'You Won this round!'
  elsif result == 'computer'
    prompt 'Computer Won this round!'
  else
    prompt "It's a tie."
  end

  prompt "The score is Player: [#{score[:player]}], " \
          "Computer: [#{score[:computer]}], " \
          "Ties: [#{score[:tie]}]"
end

def track_score(result, score)
  if result == 'player'
    score[:player] += 1
  elsif result == 'computer'
    score[:computer] += 1
  else
    score[:tie] += 1
  end
end

def display_winner(final_score)
  prompt ''
  final_score.each do |player, score|
    if score == ROUNDS && player == :player
      prompt 'You won the game!'
    elsif score == ROUNDS && player == :computer
      prompt 'The computer won the game!'
    end
  end
end

def play_again?
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt "Please enter 'y' or 'n'"
  end
end

loop do
  score = { player: 0, computer: 0, tie: 0 }
  loop do
    choice = ''
    loop do
      prompt ''
      prompt 'Choose one: '
      display_choices
      choice = gets.chomp.downcase

      break if CHOICES.key?(choice.to_sym)
      prompt "That's not a valid choice."
    end

    computer_choice = CHOICES.keys.sample.to_s

    prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

    result = round_result(choice, computer_choice)

    track_score(result, score)
    clear_screen
    display_results(result, score)

    break display_winner(score) if score.value?(ROUNDS)
  end

  prompt ''
  prompt 'Do you want to play again?'
  break unless play_again?
  clear_screen
end

prompt 'Thank you for playing.  Good bye!'
