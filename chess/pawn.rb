require_relative 'piece'

class Pawn < Piece
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
  end
  
  def symbol
    "P"
  end
  
  def move_dirs
  end
end