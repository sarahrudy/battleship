class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate     = coordinate
    @ship           = ship
    @fired_upon     = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_object)
    return false if empty? == false
      @ship = ship_object
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil
      @ship.hit
    end
      @fired_upon = true
    end

  def render(reveal = false)
    return "M" if @fired_upon == true && empty?
    return "X" if @fired_upon == true && @ship.sunk?
    return "S" if reveal == true && !empty?
    return "H" if @fired_upon == true && !empty?
    return "."
  end
end
