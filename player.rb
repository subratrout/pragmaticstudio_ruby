class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I am #{@name} with a health of #{@health} and a score of #{score}"
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
    @health + @name.length
  end

  def name=(new_name)
    @name = new_name.capitalize
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