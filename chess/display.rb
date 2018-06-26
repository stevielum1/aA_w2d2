require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    loop do
      system("clear")
      print"*---------------*\n"
      @board.grid.each_with_index do |row, idx1|
        row.each_with_index do |square, idx2|
          print "|"
          if [idx1, idx2] == @cursor.cursor_pos && !@cursor.selected
            print "#{square.to_s}".colorize(:green)
          elsif [idx1, idx2] == @cursor.cursor_pos && @cursor.selected
            print "#{square.to_s}".colorize(:blue)
          else
            print "#{square.to_s}"
          end
        end
        print "|\n"
      end
      print "*---------------*\n"
      @cursor.get_input
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.move_piece([6,5],[5,5])
  b.move_piece([1,4],[3,4])
  b.move_piece([6,6],[4,6])
  b.move_piece([0,3],[4,7])
end