module Slideable

  def moves
    x, y = @pos

  end

  private

  def move_dirs

  end

  def horizontal_dirs
    collect = []
    x, y = @pos
    (0..7).to_a.each do |y_var|
      collect << [x, y_var]
    end

    (0..7).to_a.each do |x_var|
      collect << [x_var, y]
    end

    collect.delete(@pos)
  end



  def diagonal_dirs
    diags = []
    x, y = @pos
    if

  end

  def grow_unblocked_moves_in_dir(x, y)



  end


end
