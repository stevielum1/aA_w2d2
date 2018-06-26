class Piece
  
  attr_reader :color, :board, :pos
  
  def initialize(symbol, board, pos)
    @color = symbol
    @board = board
    @pos = pos
  end
  
  def to_s
    symbol.colorize(color)
  end
  
  def empty?
    return true if symbol == " "
    return false
  end
  
  def valid_moves
  end
  
  def pos=(val)
    @pos = val
  end
  
  def symbol
    "P"
  end
  
  private
  
  def move_into_check?(end_pos)
  end
  
end
# 
# if __FILE__ == $PROGRAM_NAME
#   r = Rook.new(:white, Board.new, [0, 0])
# end