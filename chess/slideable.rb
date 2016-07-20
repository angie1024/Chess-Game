module Slideable

  def moves
    move_dirs
  end

  private

  def move_dirs

  end

  def horizontal
    x, y = @pos
    hor = get_spaces(x, y, 0, 1) + get_spaces(x, y, 0, -1)
    vir = get_spaces(x, y, 1, 0) + get_spaces(x, y, -1, 0)
    
    hor + vir
  end

  def diags
    x, y = @pos
    diag1 = get_spaces(x, y, 1, 1) + get_spaces(x, y, -1, -1)
    diag2 = get_spaces(x, y, -1, 1) + get_spaces(x, y, 1, -1)
    diag1 + diag2
  end

  def get_spaces(x, y, dx, dy)
    x_diff = x + dx
    y_diff = y + dy

    return [] unless @board.in_bounds?([x_diff, y_diff])
    return [] if @board[x_diff, y_diff].color == self.color
    return [x_diff, y_diff] unless @board[x_diff, y_diff].is_a?(NullPiece) || @board[x_diff, y_diff].color == self.color

    [[x_diff, y_diff]] + get_spaces(x_diff, y_diff, dx, dy)
  end

end
