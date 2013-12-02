class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(10) { Array.new(10) }
    # @squares = Array.new(100)
    add_all_ships
  end

  def add_all_ships
    place_patrols
    place_destroyers
    place_battleships
    place_carrier
  end

  def square_at(row, element)
    @rows[row-1][element-1]
    # @squares[(row-1)*10+element-1]
  end

  def make_ship_square(row, element)
    @rows[row-1][element-1] = "s"    
  end

  def ship_count
    s_count = []
    s_stuff =  @rows.each do |row|
      s_count << row.count('s')
    end
    s_count.reduce(:+)
  end

  def register_shot (row,element)
    if @rows[row-1][element-1] == "s"
      @rows[row-1][element-1] = "X"
    else 
      @rows[row-1][element-1] = "O"
    end

  end
  # def check_square(row,element)
  #     if @rows[row-1,element-1] == "s"
  #       @rows[row-1,element-1] = "X"
  #     else 
  #       @rows[row-1,element-1] = "O"
  #     end
  # end

  def shoot
    board.make_attacked_square
  end

# Specify locations for each ship class

  def place_carrier
    make_ship_square(4,10)
    make_ship_square(5,10)
    make_ship_square(6,10)
    make_ship_square(7,10)
    make_ship_square(8,10)
  end

  def place_battleships
    make_ship_square(9,2)
    make_ship_square(9,3)
    make_ship_square(9,4)  
    make_ship_square(9,5)

    make_ship_square(7,7)
    make_ship_square(8,7)
    make_ship_square(9,7)
    make_ship_square(10,7)
    
  end

  def place_destroyers
    make_ship_square(2,2)
    make_ship_square(3,2)
    make_ship_square(4,2)

    make_ship_square(1,4)
    make_ship_square(2,4)
    make_ship_square(3,4)

    make_ship_square(1,6)
    make_ship_square(1,7)
    make_ship_square(1,8)
  end

  def place_patrols
    make_ship_square(6,1)
    make_ship_square(7,1)

    make_ship_square(5,4)
    make_ship_square(6,4)

    make_ship_square(4,7)
    make_ship_square(4,8)

    make_ship_square(1,10)
    make_ship_square(2,10)
  end

end

# input = 'B2'


# board = Board.new
# board.add_all_ships
# board.register_shot(1,2)
# puts board.rows.inspect


#     def ship_count
#       s_count = []
#       s_stuff =  rows.each do |row|
#         s_count << row.count('s')
#       end
#       s_count.reduce(:+)
#     end

#     puts ship_count




