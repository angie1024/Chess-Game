class Piece
  attr_reader :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves

  end


  def to_s
    symbol
  end


end

class Pawn < Piece

  def initialize(color, board, pos)
    super(color, board, pos)
    @initial_pos = pos
  end

  def symbol
    if @color == :black
      "\u265f"
    else
      "\u2659"
    end
  end

  def moves

    if at_start_row?
      if @color == :black
        moves = [[1,0],[2,0]]
      else
        moves = [[-1,0],[-2,0]]
      end
    end
    #pawn attacks diagonally only if there's an opponent in space
    #pawn can only move forward if space is free
    #pawn can choose to move two spaces forward when @initial_pos = pos

  end

  private

  def at_start_row?
    false
    true if @initial_pos == pos
  end
end
