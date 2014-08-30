boggle-ruby
===========

An implementation of the boggle board algorithm in ruby.

This implementation uses a trie data structure to store a dictionary of words.

The dictionary is a list of words, included here, called 'wordlist'.  Performance was improved by only adding words to the list which begin with one of the letters in the board.

The following benchmarks are from a laptop w 4 Gb of Ram and an i3 intel proc.
Note that the dictionary load time levels off as the board gets bigger because once the board is large enough to contain all 26 letters of the alphabet, we have to load the whole thing anyway.

The interesting timings are related to the searching of the board for all of the words.

The wordlist for a grid of 4 x 4 letters loads into the trie in 1.85 seconds
A list of 39 unique words found in that grid is found in .07 seconds.

The wordlist for a grid of 10 x 10 letters loads into the trie in 2.65 seconds
A list of 367 unique words found in that grid is found in .35 seconds.

The wordlist for a grid of 25 x 25 letters loads into the trie in 2.74 seconds
A list of 2,504 unique words found in that grid is found in .925 seconds.

The wordlist for a grid of 100 x 100 letters loads into the trie in 3.98 seconds
A list of 11,402 unique words found in that grid is found in 10.9 seconds.




