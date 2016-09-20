require_relative "player"
require_relative "die"
require_relative "treasure_trove"
require_relative "loaded_die"

module GameTurn
  def self.take_turn(player)
    die = Die.new
    case die.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped"
    else
      player.woot
    end
    treasure = TreasureTrove.random
    puts "#{player.name} found a #{treasure} worth #{treasure.points} points."
    player.found_treasure(treasure)
  end
end

if __FILE__ == $0
  player = Player.new('curly', 125)
  GameTurn.take_turn(player)
end