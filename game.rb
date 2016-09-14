require_relative 'player'
require_relative "game_turn"
require_relative "treasure_trove"
class Game

  attr_reader :name
  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@name}: "
    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.size} treasures to be found."
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points."
    end
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        puts "For game #{@name}: I am #{player.name} with a health of #{player.health} and a score of #{player.score}."
        GameTurn.take_turn(player)
        puts "After game #{@name}: I am #{player.name} with a health of #{player.health} and a score of #{player.score}."
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong_players = []
    weak_players = []

    strong_players, weak_players = @players.partition {|n| n.strong?}
    puts "\n Statistics"
    puts "#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end

    puts "#{weak_players.size} weak players:"
    weak_players.each do |player|
      print_name_and_health(player)
    end


    puts "#{name} High Scores:"
    @players.sort.each do | player|
      formatted_name = player.name.ljust(20, ".")
      puts "#{formatted_name} #{player.score}"
    end


    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
  end

  def total_points
    sum = 0
    @players.each do |player|
      sum += player.points
    end
    puts "#{sum} total points from treasures found."
  end
end