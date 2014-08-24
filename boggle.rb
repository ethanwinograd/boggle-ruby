require 'lib/trie.rb'
require 'lib/square.rb'
require 'lib/word_finder.rb'
require 'lib/board.rb'
require 'lib/board_factory.rb'

puts "creating a Trie dictionary"
t=Trie.new
file = 'lib/11words'#'lib/wordlist'#
IO.readlines(file).each { |line|  t.add(line.strip!) }

b= BoardFactory.default_board
#b= BoardFactory.randomized_board(25)
b.render

wf = WordFinder.new(t, b)
b.squares.each { |key, square|  wf.search_trie(square.char, square)  }

puts "found #{wf.word_counter} words : #{wf.words_found}"

