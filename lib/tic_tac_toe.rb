require_relative "tic_tac_toe/board"
require_relative "tic_tac_toe/player"
require_relative "tic_tac_toe/interface"

# Creates the players
player1 = Player.new("Player 1", "X", :red)
player2 = Player.new("Player 2", "O", :blue)

# Create the game and its interface
game_test = Board.new(player1, player2)
interface = Interface.new(player1, player2, game_test)

moves = 0
# Repeat until someone wins or all the squares get filled
until game_test.game_ended || moves == 9
  interface.display_board
  until game_test.current_player.make_a_move
    # Display a warning saying it is an invalid move
    puts "Invalid move!"
    interface.display_board
  end
  moves += 1
end

display_tie unless game_test.game_ended

interface.display_board
Interface.play_again_screen
