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
  d = Display.new(b)
  d.render
end