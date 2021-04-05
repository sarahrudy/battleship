class Cell #created our cell class.
  attr_reader :coordinate, #coordinate method.
              :ship,  #ship method.
              :fired_upon #fired_upon method

  def initialize(coordinate) #initialize will take one argument.
    @coordinate     = coordinate#@coordinate instance variable.
    @ship           = ship #@ship instance variable
    @fired_upon     = false #fired_upon intance variable set to false.
  end

  def empty? #created empty method that will return true if there is no ship.
    @ship == nil #@ship doesn't exist
  end

  def place_ship(ship) #places ship passed to argument.
    @ship = ship #@ship exists.
  end

  def fired_upon? #sets method that returns false unless hit.
    @fired_upon #returns false by default.
  end

  def fire_upon #sets method return true if hit.
    if @ship != nil #@ship does not equal nil.
      @ship.hit #@ship.hit returns true, reducing health by 1.
    end
      @fired_upon = true #changes to @fired_upon to return true.
    end

  def render(reveal = false) #renders a cell with it's proper status.
    return "M" if @fired_upon == true && empty? #cell will render "M" if @fired_upon = true, and cell is empty.
    return "X" if @fired_upon == true && @ship.sunk? #cell will render "X" if @fired_upon = true, and sunk? method returns true, and prior render does not pass.
    return "S" if reveal == true && !empty? #cell will render "S" if (reveal = true) and cell isn't empty, and the previous two  renders do not pass.
    return "H" if @fired_upon == true && !empty? #cell will render "H" if @fired_upon = true and cell isn't empty, as well as having the prior 3 renders not to pass.
    return "." #in all other cases, cell will render "."
  end
end
