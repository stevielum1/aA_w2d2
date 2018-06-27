require_relative 'player'

class HumanPlayer < Player
  
  def initialize(color, display)
    super(color, display)
  end
  
  def make_move(board)
    display.cursor.get_input
  end
  
end