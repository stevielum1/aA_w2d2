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
    possible_moves = moves
    possible_moves.reject { |move| move_into_check?(move) }
  end
  
  def pos=(val)
    @pos = val
  end
  
  def symbol
    "P"
  end
  
  def opponent_color
    return :black if color == :white
    :white
  end
  
  def moves
  end
  
  private
  
  def move_into_check?(end_pos)
    board_copy = board.dup
    board_copy.move_piece!(pos, end_pos)
    board_copy.in_check?(color)
  end
  
end
# 
# if __FILE__ == $PROGRAM_NAME
#   r = Rook.new(:white, Board.new, [0, 0])
# end