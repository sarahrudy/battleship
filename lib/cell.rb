class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate     = coordinate
    @ship           = ship
                    # (name, length, health)
    @fired_upon     = false
  end

  # def fired_upon
  #   @fired_upon = false
  # end
  # because every cell will have a state of true/false so it makes sense to have an attribute

  def empty?
    @ship == nil
    #built in ruby method (is ship empty?)
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def fired_upon? # checking status of attribute
    @fired_upon
  # empty, miss, hit, sunk
  # check to see if it changed
  end

  def fire_upon
    @ship.hit
    @fired_upon = true
  end

  def render
    if @ship == nil
      return "."
      if @fired_upon
        return "M"
      end
    end
   #if cell is empty, return "."
    #if cell has been fired upon but has no ship, return "M"
    #if cell has been fired upon and has a ship, return "H"
    #if cell has been fired upon and has a ship that is now sunk, return "X"
    #if cell has a ship, return "S"
  end
  # one more method!

end
