require "colorize"

# Creates the class with all the methods that will display the interface for the user
class Interface
  attr_reader :player1, :player2, :board, :current_state

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @current_state = board.current_state
  end

  # Creates a method that displays the scores of the players in the CLI
  def display_scores
    puts "\n--------------------------"
    print "#{@player1.name}  #{@player1.score.to_s.colorize(@player1.color)} x "
    puts "#{@player2.score.to_s.colorize(@player2.color)}  #{@player2.name}"
    puts "--------------------------\n\n"
  end

  # Creates a method that displays the current state of the board in the CLI
  def display_board
    display_scores
    puts " #{current_state[0][0] || '1'.grey} | #{current_state[0][1] || '2'.grey} | #{current_state[0][2] || '3'.grey} "
    puts "---+---+---"
    puts " #{current_state[1][0] || '4'.grey} | #{current_state[1][1] || '5'.grey} | #{current_state[1][2] || '6'.grey} "
    puts "---+---+---"
    puts " #{current_state[2][0] || '7'.grey} | #{current_state[2][1] || '8'.grey} | #{current_state[2][2] || '9'.grey} \n\n"
  end

  # End the game
  def self.end_game(player)
    puts "--------------------------"
    puts "   #{player.name} Wins!"
    puts "--------------------------"

    display_board
  end

  # Display a tie
  def self.display_tie
    puts "--------------------------"
    puts "       It's a tie!"
    puts "--------------------------"

    display_board
  end

  # Displays the Play Again screen
  def self.play_again_screen
    puts "--------------------------"
    puts "    Play Again? (Y/N)"
    puts "--------------------------"
  end
end
