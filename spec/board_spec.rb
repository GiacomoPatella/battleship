require './board.rb'


describe Board do

  let(:board) { Board.new }

  context "New board" do

    it "should have rows with 10 elements each" do
      expect(board.rows.all? {|row| row.size == 10}).to be_true
    end
    
    it "should have 10 rows" do
      expect(board.rows.size).to eq(10)
    end
    
    it "should recognise a ship square" do
      board.make_ship_square(1,3)
      expect(board.square_at(1,3)).to eq 's'
    end


    it "should contain 30 ship squares when initialized" do
      board.add_all_ships
      expect(board.ship_count).to eq(30)
    end
  end
  
  context "Board can" do
  
    it "register a hit if a ship is present" do
        board.make_ship_square(1,3)
        board.register_shot(1,3)
        # expect(board.rows[0][2]).to eq 'X'
        expect(board.square_at(1,3)).to eq 'X'
    end

    it "register a hit if a ship is present" do
        board.register_shot(1,3)
        # expect(board.rows[0][2]).to eq 'X'
        expect(board.square_at(1,3)).to eq 'O'
    end
  end 
end