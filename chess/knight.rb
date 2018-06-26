require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  
  include Stepable
  
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
  end
  
  def symbol
    "N"
  end
  
  def move_diffs
    answer = []
    answer << [2,1]
    answer << [2,-1]
    answer << [-2,1]
    answer << [-2,-1]
    answer << [-1,-2]
    answer << [-1,2]
    answer << [1,-2]
    answer << [1,2]
    answer
  end
end