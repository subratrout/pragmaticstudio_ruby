require_relative 'player'

module Playable

  def blam
    @health = @health - 10
    puts "#{@name} got blammed!"
  end

  def woot
    @health = @health + 15
    puts "#{@name} got wooted!"
  end

  def strong?
    true if @health > 100
  end 

end