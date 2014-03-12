require 'word'
require 'definition'

class Term

  @@Terms = []

  attr_reader :words, :definitions

  def Term.create(word, definition)
    term = Term.new(word, definition)
    @@Terms << term
    term
  end

  def initialize(word, definition)
    @words = []
    @definitions = []
    add_word(word, 'English')
    add_definition(definition, 'English')
  end

  def add_definition(definition, language)
    @definitions << Definition.new(definition, language)
  end

  def add_word(word, language)
    @words << Word.new(word, language)
  end

  def edit_word(language, new_word)
    @words.each do |word|
      if word.language == language
        word.change_word(new_word)
      end
    end
  end

  def edit_definition(language, new_definition)
    @definitions.each do |definition|
      if definition.language == language
        definition.change_definition(new_definition)
      end
    end
  end

  def delete_word(language_of_word_to_be_removed)
    @words.each do |word|
      if word.language == language_of_word_to_be_removed
        @words.delete(word)
      end
    end
  end

    def delete_definition(language_of_definition_to_be_removed)
    @definitions.each do |definition|
      if definition.language == language_of_definition_to_be_removed
        @definitions.delete(definition)
      end
    end
  end
end







