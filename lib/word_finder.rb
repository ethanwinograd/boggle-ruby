require './lib/trie.rb'

class WordFinder

  attr_reader :word_counter, :words_found, :board

  def initialize(trie, board)
    @trie =trie
    @word_counter = 0
    @words_found = []
    @board = board
  end

  def search_trie(word, last_square, min_word_size=3)
    return unless @trie.branch?(word) 
    if word.size >= min_word_size and @trie.member?(word) and !@words_found.include?(word)
      @word_counter= @word_counter + 1
      @words_found << word
    end
    board.adjacent_squares(last_square.row, last_square.col).each {|square| search_trie(word + square.char, square)}
    
  end

end