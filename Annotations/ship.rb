class Ship #created ship class.
  attr_reader :name, #created name getter method.
              :length, #created length getter method.
              :health #created health getter method.

  def initialize(name, length) #Initialized Ship class. It will take 2 arguments.
    @name   = name #@name instance variable.
    @length = length #@length instance variable
    @health = @length #@health instance variable.
  end

  def sunk? #created a sunk? method that returns false unless @health > 0.
    return false if @health > 0  #ship isn't sunk if it's health is greater than 0
    true #if @health is <= 0, sunk? will return true.
  end

  def hit #created a hit method that will negate 1 from ship's health.
    @health -= 1 #@health reduces by one each time a ship is hit.
  end
end
