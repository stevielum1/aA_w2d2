require_relative 'piece'
require_relative 'rook'
require_relative 'null_piece'

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
  
  def create_default_board
    @grid.each_with_index do |row, idx|
      row.map! do |square|
        if idx == 0 || idx == 1 || idx == 6 || idx == 7
          square = Rook.new(:white, self, [0, 0])
        else
          square = NullPiece.instance
        end
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b
end