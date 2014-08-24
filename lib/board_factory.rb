require 'lib/board.rb'

class BoardFactory

  def self.default_board(board_size =4)
    puts 'constructing the board'
    
    board = [board_size]
    board[0] = ['v','r','g','x']
    board[1] = ['c','d','o','z']
    board[2] = ['a','t','c','k']
    board[3] = ['i','l','h','y']
    Board.new(board)
  end

  def self.randomized_board(board_size = 5)

    alphabet='abcdefghijklmnopqrstuvwxyz'
    board=[]
    board_size.times do |i| 
      col = []
      board_size.times { col <<  alphabet[rand(26)] }
      board[i] = col
    end
    Board.new(board)
  end

  

end