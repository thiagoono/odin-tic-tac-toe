# Initialize the class that will create each player's object
class Player
  attr_accessor :name, :score, :board, :symbol, :color

  def initialize(name, symbol, color)
    @name = name.colorize(color)
    @score = 0
    @symbol = symbol.colorize(color)
    @color = color
  end

  # Adds the logic to make a move and check if it is valid
  def make_a_move
    puts "Type the #{name}'s move:"
    move = gets.to_i - 1

    return false unless (move.is_a? Integer) || move < 1 || move > 9
    return false if @board.current_state[move / 3][move % 3]

    @board.update_current_state(move / 3, move % 3, symbol)
    true
  end
end
