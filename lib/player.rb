class Player 

  attr_reader :board


  def initialize(name) 
    @board = Board.new
    @name = name
  end 


  def name
    @name
  end


  def has_ships_still_floating?
    # board.flatten.select { |slot| slot == 'x' }.count == 25 # number of squares total ships take up
    board.rows.flatten.any? {|cell| cell == 's'}
  end


 


end

