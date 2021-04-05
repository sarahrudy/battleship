class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name   = name
    @length = length
    @health = @length
  # health is equal to length of the cruiser/submarine (ship)
  end

  def sunk?
    return false if @health > 0
  # if health, which is equal to length of ship, is greater than zero, the ship will not be sunk
    true
  # if health is 0, return true, which means ship will sink
  end

  def hit
    @health -= 1
  end
end
