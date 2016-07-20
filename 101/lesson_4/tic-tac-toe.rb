#!/usr/bin/env ruby
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
ROUNDS = 5
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(board)
  puts ''
  puts '     |     |'
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts '     |     |'
  puts ''
end

# rubocop:enable Metrics/MethodLength, Metrics/AbcSize
def clear_screen
  (system 'clear') || (system 'cls')
end

def display_players
  prompt "You're #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}"
end

def game_display(board, score)
  clear_screen
  display_score(score)
  display_players
  display_board(board)
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def board_full?(board)
  empty_squares(board).empty?
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count('X') == 2
    board.select { |sqr, mark| line.include?(sqr) && mark == ' ' }.keys.first
  end
end

def computer_marks_square!(board)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board)
    break if square
  end

  square = empty_squares(board).sample unless square
  board[square] = COMPUTER_MARKER
end

def player_marks_square!(board)
  square = ''
  loop do
    prompt 'Choose one of the following squares: ' +
           joinor(empty_squares(board))
    square = gets.chomp.to_i

    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def joinor(arr, delimiter = ', ', word = 'or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    return 'Player' if board.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if board.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def someone_won?(board)
  !detect_winner(board).nil?
end

def track_score(result, score)
  if result == 'Player'
    score[:player] += 1
  elsif result == 'Computer'
    score[:computer] += 1
  else
    score[:tie] += 1
  end
end

def display_round_winner(result)
  if result == 'Player'
    prompt 'You Won this round!'
  elsif result == 'Computer'
    prompt 'The Computer Won this round!'
  else
    prompt 'This round is a tie!'
  end
end

def display_score(score)
  prompt "The score is Player: [#{score[:player]}], " \
          "Computer: [#{score[:computer]}], " \
          "Ties: [#{score[:tie]}]"
end

def display_game_winner(final_score)
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
    board = initalize_board
    result = ''
    loop do
      game_display(board, score)
      player_marks_square!(board)
      if someone_won?(board) || board_full?(board)
        result = detect_winner(board)
        track_score(result, score)
        break
      end

      computer_marks_square!(board)
      if someone_won?(board) || board_full?(board)
        result = detect_winner(board)
        track_score(result, score)
        break
      end
    end

    game_display(board, score)
    display_round_winner(result)

    prompt 'Hit Enter to continue...'
    gets

    break display_game_winner(score) if score.value?(ROUNDS)
  end

  prompt 'Do you want to play again? (y or n)'
  break unless play_again?
end

prompt 'Thank you for playing Tic Tac Toe.  Good bye!'
