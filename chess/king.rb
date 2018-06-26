require_relative 'stepable'
require_relative 'piece'

class King < Piece
  
  include Stepable
  
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
  end
  
  def symbol
    "K"
  end
  
  def move_diffs
    answer = []
    answer << [1,1]
    answer << [0,1]
    answer << [1,0]
    answer << [-1,-1]
    answer << [-1,0]
    answer << [-1,1]
    answer << [1,-1]
    answer << [0,-1]
    answer
  end
end