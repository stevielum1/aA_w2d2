require_relative 'board'
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  
  include Slideable
  
  def initialize(symbol, board, pos)
    super
  end
  
end

if __FILE__ == $PROGRAM_NAME
  r = Rook.new(:white, Board.new, [0, 0])
end