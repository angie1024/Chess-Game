require_relative 'piece'
require_relative 'slideable'
require 'byebug'

class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def move_dirs
    horizontal
  end

  def symbol
    " ♜ "
  end
end
