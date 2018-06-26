require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
  
  include Slideable
  
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
  end
  
  def symbol
    "Q"
  end
  
  def move_dirs
    [horizontal_dirs, diagonal_dirs].flatten(1)
  end
end