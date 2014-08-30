require 'lib/trie.rb'
require 'lib/square.rb'
require 'lib/word_finder.rb'
require 'lib/board.rb'
require 'lib/board_factory.rb'
require 'benchmark'


#b= BoardFactory.default_board
puts 'generating a board..'
b= BoardFactory.randomized_board(25)
#b.render

puts "creating a Trie dictionary"
t=Trie.new
file = 'lib/wordlist'##'lib/11words'#
Benchmark.bm do |bm|
	bm.report('loading the dictionary data structure') do
		IO.readlines(file).each { |line|  t.add(line.strip!) if b.characters.include?line[0] }
	end
end


wf = WordFinder.new(t, b)

Benchmark.bm do |bm|
	bm.report('finding words in dictionary') do
		b.squares.each { |key, square|  wf.search_trie(square.char, square)  }
	end
end	
puts "found #{wf.word_counter} words "#: #{wf.words_found}"

