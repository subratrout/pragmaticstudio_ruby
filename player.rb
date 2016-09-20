class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I am #{@name} with health = #{@health}, points = #{points} and a score of #{score}"
  end

  def blam
    @health = @health - 10
    puts "#{@name} got blammed!"
  end

  def woot
    @health = @health + 15
    puts "#{@name} got wooted!"
  end

  def score
    @health + points
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def strong?
    true if @health > 100
  end

  def <=>(other)
    other.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasure: #{@found_treasures}"
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      next_treasure = Treasure.new(name, points)
      yield next_treasure
    end
  end

  def self.from_csv(string)
    name, health = string.split(',')
    player = Player.new(name, Integer(health))
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.woot
  puts player.health
  player.blam
  puts player.health
end