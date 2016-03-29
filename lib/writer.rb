class Writer

  def initialize(writer)
    @raw_text = File.read(File.dirname(__FILE__) + "/writers/#{writer}.txt")
    @text = @raw_text.downcase.gsub(/[\n]/, ' ')
    @words = @text.scan(/\w+/).uniq
    @punctuation = @text.scan(/[\.\?\!]/).flatten
  end
  
  def write_poem(num_lines=3, markov_degree=1, max_length=100)
    lines = num_lines.times.map { write_sentence(markov_degree, max_length) }
    lines.join("\n")
  end

  def write_sentence(markov_degree=1, max_length=100)
    sentence = ''
    word = @words.sample
    previous_words = Array.new(markov_degree, '')

    while word && sentence.length < max_length
      sentence += word + ' '
      potential_next_words = @text.scan(Regexp.new(previous_words.join('') + word + ' (\w+)')).flatten
      previous_words.shift
      previous_words.push(word + ' ')
      word = potential_next_words.sample
    end

    sentence.strip!()
    sentence += @punctuation.sample

    sentence
  end

end

