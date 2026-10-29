require_relative "tic_tac_toe/board"
require_relative "tic_tac_toe/player"

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

game_test = Board.new(player1, player2)

game_test.display_scores
game_test.display_board

player1.make_a_move
player2.make_a_move

player1.make_a_move
player2.make_a_move

player1.make_a_move
player2.make_a_move

player1.make_a_move
player2.make_a_move

player1.make_a_move
