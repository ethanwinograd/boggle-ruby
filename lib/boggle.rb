require 'lib/trie.rb'
require 'lib/square.rb'
require 'lib/word_finder.rb'
require 'lib/board.rb'
require 'lib/board_factory.rb'

puts "creating a Trie dictionary"
t=Trie.new
IO.readlines('wordlist').each { |line|  t.add(line.strip!) }

#b= default_board
b= BoardFactory.randomized_board(25)

eligible_squares = []
b.squares.each { |square| eligible_squares << square if t.branch?(square.char) }
wf = WordFinder.new(t)
eligible_squares.each do |square|
  wf.search_trie(square.char, square)  
end

puts "found #{wf.word_counter} words : #{wf.words_found}"

