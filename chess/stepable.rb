module Stepable

  def moves
    x, y = @pos
    valid_moves = []
    move_diffs.each do |pos_diff|
      valid_moves << [@pos[0] + pos_diff[0], @pos[1] + pos_diff[1]]
    end

    valid_moves.select { |pos| @board.in_bounds?(pos) }
  end

  def move_diffs
    ##Raise error for some reason
  end


end
