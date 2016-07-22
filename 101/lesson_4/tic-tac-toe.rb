#!/usr/bin/env ruby
ROUNDS = 5
INITIAL_PLAYER = 'choose'.freeze
MARKERS = { initial: ' ', player: 'X', computer: 'O' }.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = MARKERS[:initial] }
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
  system('clear') || system('cls')
end

def select_player
  if INITIAL_PLAYER == 'choose'
    prompt 'Starting a new round. Would you like to go first? (y or n)'
    got_yes? ? 'player' : 'computer'
  end
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

def display_players
  prompt "You're #{MARKERS[:player]}.  Computer is #{MARKERS[:computer]}"
end

def game_display(board, score)
  clear_screen
  display_score(score)
  display_players
  display_board(board)
end

def empty_squares(board)
  board.keys.select { |num| board[num] == MARKERS[:initial] }
end

def board_full?(board)
  empty_squares(board).empty?
end

def joinor(arr, delimiter = ', ', word = 'or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def mark_square!(board, player)
  player_marks_square!(board) if player == 'player'
  computer_marks_square!(board) if player == 'computer'
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
  board[square] = MARKERS[:player]
end

def computer_marks_square!(board)
  square = computer_offensive_move(board)

  square = computer_defensive_move(board) unless square
  square = 5 if !square && empty_squares(board).include?(5)
  square = empty_squares(board).sample unless square

  board[square] = MARKERS[:computer]
end

def computer_defensive_move(board)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, MARKERS[:player])
    return square if square
  end
  nil
end

def computer_offensive_move(board)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, MARKERS[:computer])
    return square if square
  end
  nil
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select do |square, mark|
      line.include?(square) && mark == MARKERS[:initial]
    end.keys.first
  end
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    return 'Player' if board.values_at(*line).count(MARKERS[:player]) == 3
    return 'Computer' if board.values_at(*line).count(MARKERS[:computer]) == 3
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
    prompt 'You won this round!'
  elsif result == 'Computer'
    prompt 'The Computer won this round!'
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

def got_yes?
  loop do
    answer = gets.chomp.downcase
    return true if %w(y yes).include?(answer)
    return false if %w(n no).include?(answer)
    prompt "Please enter 'y' or 'n'"
  end
end

loop do
  score = { player: 0, computer: 0, tie: 0 }

  loop do
    board = initalize_board
    current_player = select_player

    loop do
      game_display(board, score)
      mark_square!(board, current_player)
      current_player = alternate_player(current_player)

      break if someone_won?(board) || board_full?(board)
    end

    result = detect_winner(board)
    track_score(result, score)

    game_display(board, score)
    display_round_winner(result)

    break display_game_winner(score) if score.value?(ROUNDS)
  end

  prompt 'Do you want to play again? (y or n)'
  break unless got_yes?
end

prompt 'Thank you for playing Tic Tac Toe.  Good bye!'
