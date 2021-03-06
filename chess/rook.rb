require_relative 'slideable'
require_relative 'piece'

class Rook < Piece
  
  include Slideable
  
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
  end
  
  def symbol
    "R"
  end
  
  protected 
  
  def move_dirs
    horizontal_dirs
  end
end