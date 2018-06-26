module Slideable
  
  def horizontal_dirs
  end
  
  def diagonal_dirs
  end
  
  def moves
    self.valid_moves
  end
  
  private
  
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []
  
  def move_dirs
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
  end
  
end