require_relative "game"
require_relative "die"

describe Game do
  before do
    @game = Game.new("Knuckleheads")
    
    @initial_health = 100
    @player = Player.new("chris", @initial_health)

    @game.add_player(@player)
  end

  it "woots the player when high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play(2)
    expect(@player.health).to eq(@initial_health + 15 * 2)
  end

  it "blams the player when low number is rolled" do 
    allow_any_instance_of(Die).to receive(:roll).and_return(1)
    @game.play(2)
    expect(@player.health).to eq(@initial_health - 10 * 2)
  end

  it "skips the player when a medium number is rolled" do 
    allow_any_instance_of(Die).to receive(:roll).and_return(3)
    @game.play(2)
    expect(@player.health).to eq(@initial_health)
  end

  it "assigns a treasure for points during a player's turn" do
    game.play(1)
    expect(@player.points).not_to be_zero 
  end

end