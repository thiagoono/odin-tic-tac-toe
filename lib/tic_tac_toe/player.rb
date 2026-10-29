# Initialize the class that will create each player's object
class Player
  attr_accessor :name, :score, :board, :symbol

  def initialize(name, symbol)
    @name = name
    @score = 0
    @symbol = symbol
  end

  # Adds the logic to make a move and check if it is valid
  def make_a_move
    move = gets.to_i

    return false if (move.is_a? Integer) || move >= 1 || move <= 9

    @board.current_state[move / 3][move % 3] || @board.update_current_state(move / 3, move % 3, symbol)
  end
end
