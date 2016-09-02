require_relative 'player'
class Game

  attr_reader :name
  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    @players.each do |player|
      puts "For game #{@name}: I am #{player.name} with a health of #{player.health} and a score of #{player.score}."
      player.blam
      player.woot
      player.woot
      puts "After game #{@name}: I am #{player.name} with a health of #{player.health} and a score of #{player.score}."
    end
  end
end