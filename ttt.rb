# Tic Tack Toe

require "pry"
#game_board = {1 => '', 2 => '', 3 => '', 4 => '', 5 => '', 6 => '', 7 => '', 8 => '', 9 => ''}
game_board = ["Do_Not_Use"," "," "," "," "," "," "," "," "," "]

USE_KEYPAD_MAPPING = true

keypad_mapping = {1=>7,2=>8,3=>9,4=>4,5=>5,6=>6,7=>1,8=>2,9=>3}

def mapp_from_keypad(number,keypad_mapping)
  number = keypad_mapping[number]
end

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
  array_of_open_squares= []
  i = 0
  game_board.select.with_index do  |spot_value,index|
    if spot_value == " "
      array_of_open_squares[i] = index
      i += 1
    end
  end
  array_of_open_squares
end


def computer_picks_square(game_board)
  position = empty_positions(game_board).sample
  game_board[position ]  = 'O'
end

def user_picks_square(game_board,keypad_mapping)
  begin
    puts "Choose a position (1 to 9) to place your X"
    user_choice = gets.chomp.to_i
  end while user_choice == 0
  check_user_input(user_choice, game_board, keypad_mapping)
  if USE_KEYPAD_MAPPING
    user_choice = mapp_from_keypad(user_choice,keypad_mapping)
  end
  game_board[user_choice] = "X"
end

def check_user_input(user_choice, game_board, keypad_mapping)
  if game_board[user_choice] != " "
    puts "Please select an open Square"
    user_picks_square(game_board,keypad_mapping)
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

def print_winning_message(winner,game_board)
  if winner == "Player"
    draw_game_board(game_board)
    puts "You won!"
  else winner == "Computer"
    draw_game_board(game_board)
    puts "Computer won!"
  end
end

begin
  draw_game_board(game_board)
  user_picks_square(game_board,keypad_mapping)
  computer_picks_square(game_board)
  winner = haz_winner(game_board)
  print_winning_message(winner,game_board)
end until winner  != nil

