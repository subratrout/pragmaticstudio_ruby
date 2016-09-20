require_relative 'clumsy_player'

describe ClumsyPlayer do

  before do 
    @player = ClumsyPlayer.new("Charlie")
  end

  it "only gets half the point value for each treasure" do 
    @player.points.should == 0

    hammer = Treasure.new(:hammer, 50)

    @player.found_treasure(hammer)
    @player.found_treasure(hammer)
    @player.found_treasure(hammer)

    expect(@player.points).to be(75)

    crowbar = Treasure.new(:crowbar, 400)

    @player.found_treasure(crowbar)

    expect(@player.points).to be(275)

    yielded = []

    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    fintal_count = [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]
    expect(yielded).to eq(fintal_count)

  end

  context "with a boost factor" do
    before do 
      @initial_health = 50 
      @boost_factor = 5
      @player = ClumsyPlayer.new("klutz", @initial_health, @boost_factor)
    end

    it "has a boost factor" do 
      expect(@player.boost_factor).to eq(5)
    end

    it "gets boost factor number of woots when wooted" do
      @player.woot
      final_health = @initial_health + (15 * @boost_factor)
      
      expect(@player.health).to eq(final_health) 
    end
  end
  
end