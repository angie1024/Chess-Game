require 'colorize'
require_relative 'board'
require_relative 'cursorable'

class Display
  include Cursorable

  attr_reader :selected, :cursor_pos

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg }
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    puts "Pick a chess piece."
    build_grid.each { |row| puts row.join }

    get_input
    nil
  end

end
