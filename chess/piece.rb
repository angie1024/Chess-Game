require 'colorize'

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

  end

  def moves

  end

  def empty?
    false
  end

  def to_s
    symbol.colorize(@color)
  end



end
