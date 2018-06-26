require_relative 'piece'

class Pawn < Piece
  
  attr_reader :start_row
  
  def initialize(symbol, board, pos)
    super(symbol, board, pos)
    @start_row,_ = pos
  end
  
  def symbol
    "P"
  end
  
  def moves
    forward_steps + side_attacks
  end
  
  private
  
  def at_start_row?
    x,_ = pos
    x == @start_row
  end
  
  def forward_dir
    return -1 if start_row == 6
    1
  end
  
  def forward_steps
    answer = []
    x, y = pos
    if at_start_row?
      answer << [forward_dir+x,0+y]
      answer << [(forward_dir*2)+x,0+y]
    else
      answer << [forward_dir+x,0+y]
    end
    
    answer.select {|possible_move| board[possible_move].empty? && board.valid_pos?(possible_move)}
  end
  
  def side_attacks
    answer = []
    x, y = pos
    answer << [forward_dir+x,1+y]
    answer << [forward_dir+x,-1+y]
    
    answer.select {|possible_move| board.valid_pos?(possible_move) && board[possible_move].color == self.opponent_color }
  end
end