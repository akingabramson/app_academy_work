class Board
  attr_accessor :position
  attr_accessor :board

  def initialize
    @position = [0, 0]
    @board = []
  end

  def check_wall(x, y)
    if (x, y) has "x"
      return false
    else
      return true
    end
  end

  def move(x, y)
    if (@position[0] - x).abs == 1 || (@position[1] - y).abs == 1
      @position = [x, y] if check_wall(x, y)
    end
  end

  def all_spots(x, y)
    (x+1) .. y-1, y, y+1
    x .. y-1, y, y+1
    x-1 .. y-1, y, y+1
  end

  def open_spots(x, y)
    get all_spots(x, y).select {|x| check_wall is true}

  end

  def how_far(x, y)
    endpoint[0]
  end

end

Board.new [
  [0, 0, z],
  [0, 0, 0],
  [a, 0, 0]
]
a = 0,0

is a.coordinates == z.coordinates?
a.list = (0,1) (1, 0), (0, 0)
a.list.sift (0, 1), (1, 0)
a.move (0, 1) if check_history
history << (0, 0)


Board.length - x, Board[0].length - y
Person.coordinates [2, 0]