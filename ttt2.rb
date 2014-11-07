def initialize_board
  board = []
  (0..8).each { |position| board[position] = ' '}
  board
end


def draw_board(board)
  system 'clear'
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def empty_positions(board)
  board.select {|position| position == ' '}
end

def player_picks_square(board)
  puts "Pick a square ( 0 - 8 ):"
  position = gets.chomp.to_i
  board[position] = 'X'
end

def computer_picks_square(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board)
  winning_lines = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8],[3,5,7]]
  winning_lines.each do |line|
    if board[line[0]] == 'X' and board[line[1]] == 'X' and board[line[2]] == 'X'
      return 'Player'
    elsif board[line[0]] == 'O' and board[line[1]] == 'O' and board[line[2]] == 'O'
      return 'Computer'
    else
      return nil
    end
  end
end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_position(board).empty?


if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end
