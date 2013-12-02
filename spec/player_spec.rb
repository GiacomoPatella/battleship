require_relative "../lib/player"

describe Player do

  let(:player) { Player.new("bob") }

  it "should have a name"  do  
    expect(player.name).to eq("bob")
  end

  it "doesn't have ships still floating if there are 25 hits on the board" do
    # board = [
    #   ["x", "o", "x", "o", "o", "x", "x", "o", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "o", "o", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "o", "o", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "o", "x", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "o", "o", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "o", "o", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "o", "o", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "x", "o", "o", "o"],
    #   ["x", "o", "x", "o", "x", "o", "o", "o", "o", "o"],
    #   ["x", "o", "x", "o", "o", "o", "o", "o", "o", "o"],
    #    ]
    expect(player.has_ships_still_floating?).to be_true
  end

  it "should know that there are no ships floating" do    
    # make sure the board has no ships
    empty_board = double(:rows => Array.new(10) { ['x'] * 10 })
    player.stub(:board).and_return(empty_board)
    # perfoming the action
    ships_floating = player.has_ships_still_floating?
    # checking the expectations
    expect(ships_floating).to be_false
  end

  it 'should shoot at opponents board' do 
    opponent_board = double()
    double.should_receive(:register_shot).with([1,3])    
    player.shoot([1,3], opponent_board)
  end
end