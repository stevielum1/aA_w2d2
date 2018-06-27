require_relative 'display'
require_relative 'player'
require_relative 'human_player'
require_relative 'board'

class Game
  
  attr_reader :board, :display, :player1, :player2, :current_player
  
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(:white, @display)
    @player2 = HumanPlayer.new(:black, @display)
    @current_player = player1
  end
  
  def play
    loop do
      start_pos = nil
      end_pos = nil
      display.render
      notify_players
      while end_pos.nil?
        input = current_player.make_move(board)
        display.render
        notify_players
        if start_pos.nil? && current_player.display.cursor.selected
          start_pos = input
          current_player.display.cursor.toggle_selected
        elsif current_player.display.cursor.selected
          end_pos = input
          current_player.display.cursor.toggle_selected
        end
      end
      board.move_piece(start_pos,end_pos)
      swap_turn!
    end
  end
  
  private
  
  def notify_players
    puts "#{current_player.color}'s turn"
  end
  
  def swap_turn!
    @current_player = current_player == player1 ? player2 : player1
  end
  
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.play
end