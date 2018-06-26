module Stepable
  
  def moves
    directions = move_diffs
    answer = []
    directions.each do |diff|
      dx, dy = diff
      x, y = self.pos
      next_possible = [x+dx, y+dy]
      answer << next_possible if board.valid_pos?(next_possible) && (board[next_possible].empty? ||board[next_possible].color == self.opponent_color)
    end
    answer
  end
  
  private
  
  def move_diffs
  end
  
end