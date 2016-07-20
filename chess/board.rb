require_relative 'nullpiece'
require_relative 'piece'
require_relative 'rook'
require_relative 'queen'
require_relative 'bishop'
require_relative 'pawn'
require_relative 'knight'
require_relative 'king'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {NullPiece.instance} }
    make_starting_grid
  end

  def [](x, y)
    @grid[x][y]
  end

  def []=(x, y, value)
    @grid[x][y] = value
  end

  def move(start_pos, end_pos)
    is_king = nil
    is_king = self[start_pos[0], start_pos[1]] if self[start_pos[0], start_pos[1]].is_a?(King)
    kings_pos = true
    if is_king
       kings_pos = false unless validate_king_move(is_king.color).include?(end_pos)
    end
    if valid_move?(start_pos, end_pos) && kings_pos

      self[start_pos[0], start_pos[1]].pos = end_pos

      self[end_pos[0], end_pos[1]] = self[start_pos[0], start_pos[1]]
      self[start_pos[0], start_pos[1]] = NullPiece.instance
    end
  end

  def valid_move?(start_pos, end_pos)
    self[start_pos[0],start_pos[1]].moves.include?(end_pos)
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0,7) }
  end

  def in_check?(color)
    opp_color = switch_color(color)
    opp_moves = []
    @grid.each do |rows|
      rows.each do |piece|
        king_pos = piece.pos if piece.is_a?(King) && piece.color == color
        opp_moves += piece.moves if piece.color == opp_color
      end
    end

    opp_moves.include?(king_pos)
  end

  def switch_color(color)
    color == :white ? :black : :white
  end

  def validate_king_move(color)
    opp_color = switch_color(color)
    opp_moves = []
    @grid.each do |rows|
      rows.each do |piece|
        king_moves = piece.moves if piece.is_a?(King) && piece.color == color
        opp_moves += piece.moves if piece.color == opp_color
      end
    end

    king_moves.reject { |pos| opp_moves.include?(pos) }
  end

  def checkmate?(color)

    opp_color = switch_color(color)
    opp_moves = []
    king_moves = []
    @grid.each do |rows|
      rows.each do |piece|
        king_moves = piece.moves if piece.is_a?(King) && piece.color == color
        opp_moves += piece.moves if piece.color == opp_color
      end
    end

    byebug
    king_moves.all? { |pos| opp_moves.include?(pos) }
    false if king_moves.empty?
  end

  def make_starting_grid
    place_pawns
    place_kings
    place_queens
    place_bishops
    place_knights
    place_rooks
    'Board Loaded!'
  end

  def place_pawns
   (0..7).each do |x|
     @grid[1][x] = Pawn.new(:black,self, [1, x])
     @grid[6][x] = Pawn.new(:white,self, [6, x])
   end
 end

 def place_kings
   @grid[7][4] = King.new(:white,self, [7, 4])
   @grid[0][4] = King.new(:black,self, [0, 4])
 end

 def place_queens
   @grid[7][3] = Queen.new(:white,self, [7, 3])
   @grid[0][3] = Queen.new(:black,self, [0, 3])
 end

 def place_bishops
   [2, 5].each do |x|
     @grid[7][x] = Bishop.new(:white,self, [7, x])
     @grid[0][x] = Bishop.new(:black,self, [0, x])
   end
 end

 def place_knights
   [1, 6].each do |x|
     @grid[7][x] = Knight.new(:white,self, [7, x])
     @grid[0][x] = Knight.new(:black,self, [0, x])
   end
 end

 def place_rooks
   [0, 7].each do |x|
     @grid[7][x] = Rook.new(:white,self, [7, x])
     @grid[0][x] = Rook.new(:black,self, [0, x])
   end
 end


end
