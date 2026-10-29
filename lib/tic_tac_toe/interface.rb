# Creates the class with all the methods that will display the interface for the user
class Interface
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  # Creates a method that displays the scores of the players in the CLI
  def self.display_scores
    puts "--------------------------"
    puts "#{@player1.name}  #{@player1.score} x #{@player2.score}  #{@player2.name}"
    puts "--------------------------"
  end

  # Creates a method that displays the current state of the board in the CLI
  def self.display_board(current_state)
    puts " #{current_state[0][0] || '1'} | #{current_state[0][1] || '2'} | #{current_state[0][2] || '3'} "
    puts "---+---+---"
    puts " #{current_state[1][0] || '4'} | #{current_state[1][1] || '5'} | #{current_state[1][2] || '6'} "
    puts "---+---+---"
    puts " #{current_state[2][0] || '7'} | #{current_state[2][1] || '8'} | #{current_state[2][2] || '9'} "
  end

  # End the game
  def self.end_game(name)
    puts "--------------------------"
    puts "   #{name} Wins!"
    puts "--------------------------"

    Interface.display_board
  end
end
