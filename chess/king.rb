require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def move_diffs
    [[1,0],
    [1,1],
    [0,1],
    [-1,0],
    [0,-1],
    [-1,-1],
    [1,-1],
    [-1,1]]
  end

  def symbol
    if @color == :black
      "\u265a"
    else
      "\u2654"
    end
  end
end
