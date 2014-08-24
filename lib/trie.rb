class Trie

  attr_accessor :children, :ends_word
  
  def initialize
    @children={}
    @ends_word=false
  end

  def add(word)  
    if word.nil? || word.length==0
      @ends_word=true
      return
    else
      return if member?(word)
    end
    @children[word[0]] ||= Trie.new
    @children[word[0]].add(word[1..-1])
  end

  def branch?(word)
    return true if word.nil? ||  word.length == 0 
    return false unless @children.key?(word[0])
    @children[word[0]].branch?(word[1..-1])
  end

  def member?(word)
    if word.nil? ||  word.length == 0 
      return @ends_word
    end
    if @children.key?(word[0]) 
      return @children[word[0]].member?(word[1..-1]) 
    else
      return false
    end
  end

  def ends_word?
    @ends_word
  end

  def remove(word)
  end

  def show_trie()
    #@children.each do |key, t|
    #  o=[] 
    #  o<< key  
    #  o<< ". " if t.ends_word?
    #  puts o.join
    #  t.show_trie if t.children
    #end
    puts "---\n"
    puts @children.keys
    puts "---\n"
    @children.each {|key, t| t.show_trie }
  end
end