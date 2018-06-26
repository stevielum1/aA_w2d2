require_relative 'slideable'
require_relative 'piece'

class Rook < Piece
  
  include Slideable
  
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
  end
  
end

# if __FILE__ == $PROGRAM_NAME
#   r = Rook.new(:white, Board.new, [0, 0])
# end