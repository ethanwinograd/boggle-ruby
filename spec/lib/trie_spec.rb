#trie_spec.rb

require "./lib/trie.rb"

describe Trie do

	it 'should return false when asked for a missing word' do
		expect(Trie.new().member?('alakazam')).to be false  
	end


end