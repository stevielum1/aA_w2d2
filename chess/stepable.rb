module Stepable
  
  def moves
    directions = move_diffs
    answer = []
    directions.each do |diff|
      dx, dy = diff
      x, y = self.pos
      next_possible = [x+dx, y+dy]
      answer << next_possible if board.valid_pos?(next_possible) && board[next_possible].empty?
    end
    answer
  end
  
  private
  
  def move_diffs
  end
  
end