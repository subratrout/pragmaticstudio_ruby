# name1 = "larry"
# name2 = "curly"
# name3 = "moe"
# name4 = "shemp"

# health1 = 60
# health2 = 125
# health3 = 100
# health4 = 90


# puts "#{name1.capitalize}'s health is #{health1}."
# puts "#{name2.upcase}'s health is #{health2}."
# text = "#{name3.capitalize}'s health is #{health3}."

# puts text.center(50, "*")

# shemp_data = name4.capitalize

# shemp_data_ljust = shemp_data.ljust(20, ".")

# puts "#{shemp_data_ljust} #{health4} health."

# puts "#{name4.capitalize.ljust(20, ".")} #{health4} health."
# puts "Players: \n\t#{name1}\n\t #{name2} \n\t #{name3}"


# health2 = health1

# puts "#{name2.upcase}'s health is #{health2}"

# health1 = 30
# puts "#{name1.capitalize}'s health is #{health1}"
# puts "#{name2.upcase}'s health is #{health2}"
# 

require_relative "player"
require_relative "game"


player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

# puts player1.inspect
# puts player1
# puts player2
# puts player3

# player3.blam
# puts player3
# player3.woot
# puts player3

# puts player1.health
# puts player2.health
# puts player3.health

# player2.name = "laurence"

# puts player2.name

# players = [player1, player2, player3]

# puts "There are #{players.size} players in the game."

# players.each do |player|
#   player.blam
#   player.woot
#   player.woot
#   puts "I am #{player.name} with a health of #{player.health} and a score of #{player.score}."
# end

# players.pop
# player4 = Player.new("shemp", 90)

# players.push(player4)



knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(2)
knuckleheads.print_stats
knuckleheads.total_points
