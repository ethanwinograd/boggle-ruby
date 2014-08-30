#board_spec
require 'lib/board_factory.rb'
require 'lib/board.rb'

describe Board do 

	let(:board) {BoardFactory.default_board}
	let(:adj_squares_corner) { board.adjacent_squares(0,0) }
	let(:adj_squares_middle) { board.adjacent_squares(1,2) }

	context '.adjacent_squares' do
		it 'should have 3 adjacent squares if it is in the top corner (0,0)' do
			expect(adj_squares_corner.size == 3)
		end

		it 'should have 8 adjacent squares if it is in the middle of the board' do
			expect(adj_squares_middle.size == 8)
		end
	end

	context '.contains?' do
		it 'should return true when asked for a square at 0,0' do
			expect(board.contains?(0,0)).to be true
		end

		it 'should return false when asked for a square at 99,0' do
			expect(board.contains?(99,0)).to be false
		end

	end
	
end