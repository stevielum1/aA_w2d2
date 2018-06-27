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
      starting_piece = self[start_pos]
      valid_end_pos = starting_piece.valid_moves
      raise RuntimeError.new("Not a valid move") unless valid_end_pos.include?(end_pos)
      #begin 
      # raise RuntimeError.new("No piece at beginning position") if self[start_pos] == NullPiece.instance
      # raise RuntimeError.new("Piece at end position") if self[end_pos] != NullPiece.instance && self[end_pos].color == self[start_pos].color 
      self[start_pos].pos = end_pos
      self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
    rescue RuntimeError => e
      puts e.message
    end
  end
  
  def move_piece!(start_pos, end_pos)
    self[start_pos].pos = end_pos
    self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
  end
  
  def valid_pos?(pos)
    x,y = pos
    return false unless x.between?(0, 7) && y.between?(0, 7)
    true
  end
  
  def checkmate?(color)
    if in_check?(color)
      @grid.each do |row|
        row.each do |square|
          return true unless square.color == color && square.valid_moves.empty?
        end
      end
    end
    false
  end
  
  def in_check?(color)
    opponent_color = color_flipper(color)
    opponent_moves = possible_team_moves(opponent_color)
    defending_king_pos = find_position_king(color)
    return true if opponent_moves.include?(defending_king_pos)
    false
  end
  
  def find_position_king(color)
    @grid.each do |row|
      row.each do |square|
        return square.pos if square.instance_of?(King) && square.color == color
      end
    end
    nil
  end
  
  def possible_team_moves(color)
    moves = []
    @grid.each do |row|
      row.each do |square|
        if square.color == color
          piece_moves = square.moves
          moves << piece_moves
        end
      end
    end
    moves.flatten(1)
  end
  
  def dup
    new_board = Board.new
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        pos = [idx1, idx2]
        square.instance_of?(NullPiece) ? new_board[pos] = NullPiece.instance : new_board[pos] = square.dup 
      end
    end
    new_board
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
  
  def color_flipper(color)
    return :black if color == :white
    :white
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  pos = [0,0]
end