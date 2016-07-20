class Pawn < Piece

  def initialize(color, board, pos)
    super(color, board, pos)
    @initial_pos = pos
  end

  def symbol
    ' ♟ '
  end

  def move_diffs
    @color == :black ? moves = [1, 0] : moves = [-1, 0]

    total_avilible = get_diag + [moves]
    total_avilible << at_start_row if @initial_pos == @pos
    total_avilible
  end

  def moves
    x, y = @pos
    valid_moves = []
    move_diffs.each do |pos_diff|
      valid_moves << [@pos[0] + pos_diff[0], @pos[1] + pos_diff[1]]
    end

    valid_moves.select { |pos| @board.in_bounds?(pos) && @board[pos[0],pos[1]].color != self.color }

    valid_moves[2..-1] += valid_moves[0..1].select { |pos| !@board[pos[0],pos[1]].is_a?(NullPiece) }
    valid_moves
  end

  def get_diag
    if @color == :black
      moves = [[1,1], [1,-1]]
    else
      moves = [[-1,-1], [-1,1]]
    end
    moves
  end

  def at_start_row
    if @color == :black
      moves = [2, 0]
    else
      moves = [-2, 0]
    end
  end
end
