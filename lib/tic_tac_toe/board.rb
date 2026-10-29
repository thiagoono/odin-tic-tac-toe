require "colorize"

# Creates the class that will display the board and register the moves
class Board
  attr_reader :current_state
  attr_accessor :current_player, :game_ended

  # Initializes the object and create an array with all the moves of the players
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    player1.board = self
    player2.board = self

    @game_ended = false

    @current_state = Array.new(3, Array.new(3))
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
    check_board(symbol)
  end

  # Checks if there is a winner in the game
  def check_board(symbol)
    check_rows(symbol)
    check_columns(symbol)
    check_diagonals(symbol)
  end

  # Checks for rows
  def check_rows(symbol)
    winner_row = nil
    current_state.each do |row|
      winner_row = row if row.uniq == [symbol]
    end

    change_color(winner_row)
    end_game if winner_row
  end

  # Checks for columns
  def check_columns(symbol)
    winner_column = nil
    (0..2).each do |i|
      if [@current_state[0][i], @current_state[1][i], @current_state[2][i]].uniq == [symbol]
        @any_winner = true
        winner_column = [@current_state[0][i], @current_state[1][i], @current_state[2][i]]
      end
    end

    change_color(winner_column)
    end_game if winner_column
  end

  # Checks for diagonals
  def check_diagonals(symbol)
    if [@current_state[0][0], @current_state[1][1], @current_state[2][2]].uniq == [symbol]
      winner_diagonal = [[0, 0], [1, 1], [2, 2]]
    end

    if [@current_state[0][2], @current_state[1][1], @current_state[2][0]].uniq == [symbol]
      winner_diagonal ||= [[0, 2], [1, 1], [2, 2]]
    end

    change_color(winner_diagonal)
    end_game if winner_diagonal
  end

  # End the game
  def end_game
    puts "--------------------------"
    puts "  #{current_player.name} Wins!"
    puts "--------------------------"

    display_board
    play_again_screen
  end

  # Changes the color of the winning line
  def change_color(winner_line)
    winner_line.each do |indexes|
      row, column = indexes

      current_state[row][column] = current_state[row][column].colorize.red
    end
  end

  # Displays the Play Again screen
  def play_again_screen
    puts "--------------------------"
    puts "    Play Again? (Y/N)"
    puts "--------------------------"
  end
end
