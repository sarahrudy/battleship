class Cell
  attr_reader :coordinate,
              :ship


  def initialize(coordinate)
    @coordinate   = coordinate
    @ship         = ship

  end

  def empty?
    @ship.nil?
  end

  def place_ship(name)
    @ship = name
  end

  def fired_upon?
    @hit == true

  end

  def fire_upon
    @health -= 1
  end
end
