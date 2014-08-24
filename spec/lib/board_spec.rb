#board_spec
require 'lib/board_factory.rb'
require 'lib/board.rb'

describe Board do 

	let(:board) {BoardFactory.default_board}
		

	context '.contains?' do
		it 'should return true when asked for a square at 0,0' do
			expect(board.contains?(0,0)).to be true
		end

		it 'should return false when asked for a square at 99,0' do
			expect(board.contains?(99,0)).to be false
		end

	end
	
end