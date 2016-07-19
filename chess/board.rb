class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end


  def move(start_pos, end_pos)
    raise "No piece at this position" if start_pos.nil?
    raise "Not a valid move" unless valid_move?
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0,7) }
  end


end
