class Word
  attr_reader :word, :language

  def initialize(word, language)
    @language = language
    @word = word
  end

  def change_word(new_word)
    @word = new_word
  end
end
