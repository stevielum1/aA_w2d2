require_relative 'piece'
require_relative 'rook'
require_relative 'null_piece'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require_relative 'knight'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    create_default_board
  end
  
  def [](pos)
    grid[pos.first][pos.last]
  end
  
  def []=(pos, value)
    @grid[pos.first][pos.last] = value
  end
  
  def move_piece(start_pos, end_pos)
    begin 
      raise RuntimeError.new("No piece at beginning position") if self[start_pos] == NullPiece.instance
      raise RuntimeError.new("Piece at end position") if self[end_pos] != NullPiece.instance
      self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
    rescue RuntimeError => e
      puts e.message
    end
  end
  
  def valid_pos?(pos)
    x,y = pos
    return false unless x.between?(0, 7) && y.between?(0, 7)
    true
  end
  
  private
  
  STARTING_POSITIONS = {
    [0,0] => :rook,
    [0,1] => :knight,
    [0,2] => :bishop,
    [0,3] => :queen,
    [0,4] => :king,
    [0,5] => :bishop,
    [0,6] => :knight,
    [0,7] => :rook,
    [1,0] => :pawn,
    [1,1] => :pawn,
    [1,2] => :pawn,
    [1,3] => :pawn,
    [1,4] => :pawn,
    [1,5] => :pawn,
    [1,6] => :pawn,
    [1,7] => :pawn,
    [7,0] => :rook,
    [7,1] => :knight,
    [7,2] => :bishop,
    [7,3] => :queen,
    [7,4] => :king,
    [7,5] => :bishop,
    [7,6] => :knight,
    [7,7] => :rook,
    [6,0] => :pawn,
    [6,1] => :pawn,
    [6,2] => :pawn,
    [6,3] => :pawn,
    [6,4] => :pawn,
    [6,5] => :pawn,
    [6,6] => :pawn,
    [6,7] => :pawn,
  }
  def create_default_board  
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        color = :white if idx1 == 0 || idx1 == 1
        color = :black if idx1 == 6 || idx1 == 7
        position = [idx1,idx2]
        case STARTING_POSITIONS[position]
        when :rook
          self[position] = Rook.new(color, self, position)
        when :knight
          self[position] = Knight.new(color, self, position)
        when :bishop
          self[position] = Bishop.new(color, self, position)
        when :queen
          self[position] = Queen.new(color, self, position)
        when :king
          self[position] = King.new(color, self, position)
        when :pawn
          self[position] = Pawn.new(color, self, position)
        else
          self[position] = NullPiece.instance
        end
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b
  b.render
end