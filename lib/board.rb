require 'lib/square.rb'

class Board

  attr_accessor :squares, :board_size, :characters

  def initialize(board)
    @board_size = board.size
    @squares = {}
    @adjacent_squares = {}
    @characters = []
    for row in 0...@board_size
      for col in 0...@board_size
      	char = board[row][col]
        @squares["#{row}_#{col}"] = Square.new(row, col, char)
        @characters << char
      end
    end
  end



  def adjacent_squares(row, col)
    @adjacent_squares["#{row}_#{col}"] ||= adj_squares(row, col)
  end

  def render
    out = ""
    for row in 0...@board_size
      @board_size.times {out << "___ "} 
      for col in 0...@board_size
          out << "\n\n|" if col == 0 
          out << " #{square_at(row,col).char} |"
      end
      out << "\n"
    end
    @board_size.times {out << "___ " if row = @board_size-1}
    
    puts out
  end

  def contains?(row,col)
    @squares.key?("#{row}_#{col}")
  end

  private
  def adj_squares(row, col)
    adj_sq = []
    if row > 0
      adj_sq << square_at(row-1, col)
      adj_sq << square_at(row-1, col-1) unless col == 0
      adj_sq << square_at(row-1, col+1) unless col == @board_size-1
    end

    adj_sq << square_at(row, col-1) unless col == 0
    adj_sq << square_at(row, col+1) unless col == @board_size-1

    if row < @board_size -1
      adj_sq<< square_at(row+1, col-1) unless col == 0
      adj_sq << square_at(row+1, col)
      adj_sq << square_at(row+1, col+1) unless col == @board_size-1
    end
    adj_sq
  end
  
  def square_at(row, col)
    @squares["#{row}_#{col}"] ||= Square.new(row, col, board[row][col])
  end

end

