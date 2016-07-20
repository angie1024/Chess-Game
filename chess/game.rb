require_relative 'display'
require_relative 'board'
require 'byebug'

class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def get_start_and_end
    pos = []
    until @display.selected
      @display.render
      pos << @display.cursor_pos if @display.selected
      # @display.selected = false if @board[pos[0],pos[1]].is_a?(NullPiece)
    end

    while @display.selected
      @display.render
      pos << @display.cursor_pos unless @display.selected
    end

    pos
  end

  def play
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      start_pos, end_pos = get_start_and_end
      @board.move(start_pos, end_pos)
    end
    "Checkmate!"
  end
end
