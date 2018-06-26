require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece
  
  include Slideable
  
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
  end
  
  def symbol
    "B"
  end
  
  def move_dirs
    diagonal_dirs
  end
end