module Slideable
  
  def horizontal_dirs
    HORIZONTAL_DIRS
  end
  
  def diagonal_dirs
    DIAGONAL_DIRS
  end
  
  def moves
    directions = move_dirs
    answer = []
    directions.each do |direction|
      dx, dy = direction
      answer << grow_unblocked_moves_in_dir(dx, dy)
    end
    answer.flatten(1)
  end
  
  private
  
  HORIZONTAL_DIRS = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]
  DIAGONAL_DIRS = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]
  
  def move_dirs
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
    starting_position = self.pos
    answer = []
    x, y = starting_position
    next_possible = [x+dx,y+dy]
    while board.valid_pos?(next_possible) && board[next_possible].empty?
      answer << next_possible 
      x, y = next_possible
      next_possible = [x+dx,y+dy]
    end
    answer 
  end
end