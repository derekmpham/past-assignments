require_relative 'die'

class RubyRacer
  attr_reader :players, :die, :length

  def initialize(players, die, length = 30)
    @players = players
    @die = die
    @length = length
    @board = Hash.new

    # iterate through each player to create a "lane" for each player
    @players.each do |player|
      @board[player] = Array.new(@length){' '} #-->each array in the @board hash represents a "lane" for each player
    end

    # location of both players at beginning of game (iterating to establish location of each player)
    @board.each do |player, location| #-->player represents row (i.e. "lane") and location can be thought as column
      location[0] = player
    end

  end


  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    finish = false #-->initially, no one has finished the race

    # iterate to determine location of each player 
    @board.each do |player, location|
      if location[@length - 1] == player #-->if statement describes finish line location
        finish = true                        # (@length - 1 is used because we are referring to
      end                                    # index of finish line location
    end
    finish
  end


  # Returns the winner if there is one, +nil+ otherwise
  def winner
    # initially, we have not determined our winner
    victorious_player = ""

    @board.each do |player, location| #-->iterate to determine location of each player
      if location[@length - 1] == player #-->if one a player's location is at the finish line
        victorious_player = player.to_s      # then that player is the winner
      end
    end
    victorious_player
  end


  # Rolls the die and advances +player+ accordingly
  def advance_player(player)
    # current_spot determined by pinpointing player's respective "lane" and then indexing player's horizontal position in the "lane"
    current_spot = @board[player].index(player)
    new_spot = current_spot + @die.roll #-->progression of player based on die roll (from Die class in die.rb)

    # position of a player throughout the game
    if new_spot < @length #-->new_spot technically never reaches @length since new_sport deals with index
      @board[player][new_spot] = player #-->new position of player
      @board[player][current_spot] = ' ' #-->previous position replaced with ' ' because that spot is now empty after player movement
    end

  end

  # Returns the current state of the game as a string
  # that can be printed on the command line
  # The board should have the same dimensions each time
  def board_visualization
    #iterate through each "lane" and column to visually show vertical grid of the board
    @board.map do |player, location|
      location.join('|')
    end
  end

end

