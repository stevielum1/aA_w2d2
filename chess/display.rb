require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  
  attr_reader :cursor
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    system("clear")
    @board.grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        if [idx1, idx2] == @cursor.cursor_pos && !@cursor.selected
          print "#{square.to_s}".colorize(:background => :red).bold.blink
        elsif [idx1, idx2] == @cursor.cursor_pos && @cursor.selected
          print "#{square.to_s}".colorize(:background => :blue).bold
        else
          print "#{square.to_s}".colorize(:background => :light_white).bold if (idx1+idx2).odd?
          print "#{square.to_s}".colorize(:background => :green).bold if (idx1+idx2).even?
        end
      end
      puts
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.move_piece([6,5],[5,5])
  b.move_piece([1,4],[3,4])
  b.move_piece([6,6],[4,6])
  b.move_piece([0,3],[4,7])
  d = Display.new(b)
  d.render
end