require_relative 'player'
require_relative "game_turn"
require_relative "treasure_trove"
require 'csv'
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
     puts high_score_entry(player)
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
    sum
  end

  def load_players(from_file)
    CSV.foreach(from_file) do |row|
      player = Player.new(row[0], row[1].to_i)
      add_player(player)
    end
  end

  def save_high_scores(to_file = "high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@name} High Scores:"
      @players.sort.each do |player|
       file.puts high_score_entry(player)
      end
    end
  end

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, ".")
    "#{formatted_name} #{player.score}"
  end
end