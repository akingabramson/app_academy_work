require 'set'

=begin
Man is born free, and everywhere he is in chains.
=end

adjacent words returns set of adjacent words
candidates returns set of possible words
#until parent words has target, candidates cuts down possible words
#parent words is a set of all the words we've gone to?
#get adjacent words to recent words

class WordChainer
  def self.adjacent_words(word, candidates)
    # variable name *shadows* (hides) method name; references inside
    # `adjacent_words` to `adjacent_words` will refer to the variable,
    # not the method. This is common, because side-effect free methods
    # are often named after what they return.
    adjacent_words = Set.new

    # NB: I gained a big speedup by checking to see if small
    # modifications to the word were in the dictionary, vs checking
    # every word in the dictionary to see if it was "one away" from
    # the word. Can you think about why?
    word.length.times do |index|
      ("a".."z").each do |letter|
        new_word = word.dup
        new_word[index] = letter

        adjacent_words << new_word if candidates.include?(new_word)
      end
    end

    adjacent_words
  end

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def build_chain(source, target)
    return nil if source.length != target.length

    # winnow the dictionary to possibly useful words
    candidates = @dictionary.select { |word| word.length == source.length }
    candidates = Set.new(candidates) - [source]

    # words we've reached in the previous round, and need to grow from
    recent_words = Set.new([source])
    # map each word to the word we found it from; `source` has no
    # parent
    parent_words = { source => nil }

    # keep looping until we find the target, or can't find any new
    # words
    until (parent_words.has_key?(target)) || (recent_words.empty?)
      recent_words, new_parent_words = find(recent_words, candidates)

      # new_words are the new recent_words
      parent_words.merge!(new_parent_words)

      # filter candidates of new_words; we never need to return to a
      # word that we've found previously. In fact, we might enter a
      # loop if we revisted an old word!
      candidates -= recent_words
    end

    path(parent_words, target)
  end

  def find(recent_words, candidates)
    # note how this method doesn't modify any instance variables; a
    # method like this is easy to reason about, because it
    # communicates with the rest of the class through its return
    # value, which we can track easily
    new_words = Set.new
    new_parent_words = {}

    # take each of the recent words and grow it
    recent_words.each do |recent_word|
      adjacent_words = WordChainer.adjacent_words(recent_word, candidates)

      new_words += adjacent_words
      adjacent_words.each do |adjacent_word|
        new_parent_words[adjacent_word] = recent_word
      end
    end

    [new_words, new_parent_words]
  end

  def path(parent_words, target)
    return nil unless parent_words.has_key?(target)

    reversed_path = [target]
    # will stop at `source`, which has `nil` parent
    until parent_words[reversed_path.last].nil?
      reversed_path << parent_words[reversed_path.last]
    end

    reversed_path.reverse
  end
end

dict = File.readlines('./2of12.txt')
dict.map! {|x| x.chomp}

a = WordChainer.new(dict)
p a.build_chain("flip", "")