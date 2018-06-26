require_relative 'display'
require_relative 'player'
require_relative 'board'

class Game
  
  def initialize(board, display, player1, player2)
    @board = board
    @display = display
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end
  
  def play
  end
  
  private
  
  def notify_players
  end
  
  def swap_turn!
    @current_player = @current_player == player1 ? player2 : player1
  end
  
end