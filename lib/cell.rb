class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate     = coordinate
    @ship           = ship
    @fired_upon     = false
  end

  def empty? #created empty method that will return true if there is no ship.
    @ship == nil
  end

  def place_ship(ship) #places ship passed to argument
    @ship = ship
  end

  def fired_upon? #sets method that returns false unless hit
    @fired_upon
  end

  def fire_upon #sets method return true if hit
    if @ship != nil
      @ship.hit
    end
      @fired_upon = true
    end

  def render(reveal = false) #renders a cell with it's proper status
    return "M" if @fired_upon == true && empty?
    return "X" if @fired_upon == true && @ship.sunk?
    return "S" if reveal == true && !empty?
    return "H" if @fired_upon == true && !empty?
    return "."
  end
end
