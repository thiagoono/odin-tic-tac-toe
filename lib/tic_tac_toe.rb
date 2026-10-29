require_relative "tic_tac_toe/board"
require_relative "tic_tac_toe/player"
require_relative "tic_tac_toe/interface"

# Creates the players
player1 = Player.new("Player 1", "X", :red)
player2 = Player.new("Player 2", "O", :blue)
answer = "Y"

while answer[0] == "Y"
  # Create the game and its interface
  game = Board.new(player1, player2)
  interface = Interface.new(player1, player2, game)

  moves = 0
  # Repeat until someone wins or all the squares get filled
  until game.game_ended || moves == 9
    interface.display_board
    until game.current_player.make_a_move
      # Display a warning saying it is an invalid move
      Interface.invalid_move
      interface.display_board
    end
    moves += 1
  end

  # Display the tie screen or the winner screen
  if game.game_ended
    Interface.end_game
  else
    Interface.display_tie
  end
  interface.display_board

  Interface.play_again_screen
  answer = gets.capitalize
end
