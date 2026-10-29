# Creates the class that will display the board and register the moves
class Board
  attr_reader :current_state

  # Initializes the object and create an array with all the moves of the players
  def initializer(player1, player2)
    @player1 = player1
    @player2 = player2

    player1.board = self
    player2.board = self

    self.current_state = Array.new(Array.new(nil, 3), 3)
  end

  # Creates a method that displays the scores of the players in the CLI
  def display_scores
    puts "--------------------------"
    puts "#{@player1.name}  #{@player1.score} x #{@player2.score}  #{@player2.name}"
    puts "--------------------------"
  end

  # Creates a method that displays the current state of the board in the CLI
  def display_board
    puts " #{current_state[0][0] || ' '} | #{current_state[0][1] || ' '} | #{current_state[0][2] || ' '} "
    puts "---+---+---"
    puts " #{current_state[1][0] || ' '} | #{current_state[1][1] || ' '} | #{current_state[1][2] || ' '} "
    puts "---+---+---"
    puts " #{current_state[2][0] || ' '} | #{current_state[2][1] || ' '} | #{current_state[2][2] || ' '} "
  end

  # Creates the method to update the current state of the board and use it to check if the game is over
  def update_current_state(row, column, symbol)
    @current_state[row][column] = symbol
  end
end
