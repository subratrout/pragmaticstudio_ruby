require_relative "player"

describe Player do

  before do
    @initial_health = 150
    @player = Player.new("john", @initial_health)
  end
  it "has a capitalize name" do

    expect(@player.name).to be == "John"
    # or
    # expect(player.name).to eq("John")
  end

  it "has an initial health" do
    expect(@player.health).to be(150) 
  end

  it "has a string representation" do 
    expect(@player.to_s).to eq("I am John with a health of 150 and a score of 154")
  end

  it "computes a score as sum of its health and name length" do
    expect(@player.score).to eq(@player.health + @player.name.length) 
  end

  it "increases health by 15 when wooted" do
    @player.woot
    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    expect(@player.health).to eq(@initial_health - 10) 
  end

  context "with a health greater than 100" do 
    before do
      @player = Player.new("larry", 150)
    end
  
    it "is strong" do 
      expect(@player.strong?).to be_truthy
    end
  end

  context "with a health less than 100" do 
    before do 
      @player = Player.new("Moe", 100)
    end

    it "is wimpy" do 
      expect(@player.strong?).to be_falsy
    end

  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)
      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing order of score" do
      sorted_players = [@player3, @player2, @player1]
      expect(@players.sort).to eq(sorted_players)
    end 
  end

  it "computes points as the sum of all treasure points" do
    @player.points.should == 0

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 50

    @player.found_treasure(Treasure.new(:crowbar, 400))

    @player.points.should == 450

    @player.found_treasure(Treasure.new(:hammer, 50))

    @plyaer.points.should == 500
  end
end