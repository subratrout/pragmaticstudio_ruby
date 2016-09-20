require_relative 'berserk_player'

describe BerserkPlayer do
  before do 
    @initial_health = 50
    @player = BerserkPlayer.new("berserker", @initial_health)
  end

  it "does not go berserk when wooted up to 5 times" do 
    1.upto(5) {@player.woot}

    @player.berserk?.should be_falsey
  end
  
  it "goes berserk when wooted more than 5 times" do 
    1.upto(6){@player.woot}

    @player.berserk?.should be_truthy
  end

  it "gets wooted instead of blammed when it's gone berserk" do 

    1.upto(6){@player.woot}
    1.upto(2){@player.blam}

    @player.health.should == @initial_health + (15 * 8)
  end
end