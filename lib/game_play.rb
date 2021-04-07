class GamePlay
  attr_reader

  def initialize
    @AI_player_input  = ""
    @RL_player_input  = ""
  end
end

  def start_game
  intro = "Welcome to BATTLESHIP \n
          Enter p to play. Enter q to quit."
    @AI_player_input = intro
  end
