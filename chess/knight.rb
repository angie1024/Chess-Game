require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def move_diffs
    [[1,2],
    [2,1],
    [2,-1],
    [1,-2],
    [-2,-1],
    [-1,-2],
    [-2,1],
    [-1,2]]
  end

  def symbol
    if @color == :black
      "\u265e"
    else
      "\u2658"
    end
  end
end
