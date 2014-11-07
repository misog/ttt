# Tic Tack Toe

require "pry"
#game_board = {1 => '', 2 => '', 3 => '', 4 => '', 5 => '', 6 => '', 7 => '', 8 => '', 9 => ''}
game_board = ["Do_Not_Use"," "," "," "," "," "," "," "," "," "]

def draw_game_board(game_board)
  puts "\e[H\e[2J"
  puts "     |     |"
  puts "  #{game_board[1]}  |  #{game_board[2]}  |  #{game_board[3]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{game_board[4]}  |  #{game_board[5]}  |  #{game_board[6]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{game_board[7]}  |  #{game_board[8]}  |  #{game_board[9]} "
  puts "     |     |"
end

def empty_positions(game_board)
  array = []
  i = 0
  game_board.select.with_index do  |x,y|
    if x == " "
      array[i ] = y
      i = i +1
    end
  end
  array
end


def computer_picks_square(game_board)
  position = empty_positions(game_board).sample
  game_board[position ]  = 'O'
end

def user_picks_square(game_board)
  begin
    puts "Choose a position (1 to 9) to place your X"
    user_choice = gets.chomp.to_i
  end while user_choice == 0
  check_user_input(user_choice, game_board)
  game_board[user_choice] = "X"
end

def check_user_input(user_choice, game_board)
  if game_board[user_choice] != " "
    puts "Please select an open Square"
    user_picks_square(game_board)
    binding.pry
  end
end

def haz_winner(game_board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if game_board.values_at(*line).count('X') == 3
    return "Computer" if game_board.values_at(*line ).count('O') == 3
  end
  nil
end

def print_winning_message(winner)
  if winner == "Player"
    puts "You won!"
  else winner == "Computer"
    puts "Computer won!"
  end
end

begin
  draw_game_board(game_board)
  user_picks_square(game_board)
  computer_picks_square(game_board)
  winner = haz_winner(game_board)
  print_winning_message(winner)
end until winner  != nil







