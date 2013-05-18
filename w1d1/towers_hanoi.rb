class Game
  attr_accessor :towers, :rod1, :rod2, :rod3, :final_disks

  def initialize(discs)
    @rod1 = []
    @rod2 = []
    @rod3 = []

    discs.times do |num|
      @rod1.push(num+1)
    end
    @final_disks = @rod1

    while has_won? == false
      status
      p "Which Rod would you like to move from?"
      @from = gets.chomp
      p "Which rod would you like to move to?"
      @to = gets.chomp
      move("rod#{@from}", "rod#{@to}")
    end
    p "you won!"
  end

  def move(from_rod, to_rod)
    if self.send(from_rod.to_sym).count != 0
      if self.send(to_rod.to_sym).last.to_i < self.send(from_rod.to_sym).last
        movingdisc = self.send(from_rod.to_sym).pop()
        self.send(to_rod.to_sym).push movingdisc
      else
        return 'To Rod Disc is too small'
      end
    else
      return "From Rod is Empty"
    end
  end

  def has_won?
    if @rod2 == @final_disks || @rod3 == @final_disks
      return true
    else
      return false
    end
  end

  def status
    p "Your status is:"
    p "rod1: #{@rod1}"
    p "rod2: #{@rod2}"
    p "rod3: #{@rod3}"
  end

end


a = Game.new(3)