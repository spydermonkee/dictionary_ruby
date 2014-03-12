require 'rspec'
require 'dictionary'

describe 'Term' do
  it 'initializes an entry into the dictionary' do
    test_Term = Term.new("chicken", "closest relative to the T-Rex")
    test_Term.should be_an_instance_of Term
  end

  describe '.create' do
    it 'creates a news Term with word and definition arrays with one word and one definition in them' do
      test_term = Term.create('word', 'definition')
      test_term.definitions[0].definition.should eq 'definition'
    end
  end

  describe '#add_word' do
    it 'should add a word to an existing object' do
      test_term = Term.create('dog', 'definition of dog')
      test_term.add_word('perro', 'Spanish')
      test_term.words[1].word.should eq 'perro'
    end
  end

  describe '#add_definition' do
    it 'should add a definition to an existing object' do
      test_term = Term.create('Mac', 'one of the Epicodus teachers')
      test_term.add_definition('the smelliest Epicodus teacher', "Truth")
      test_term.definitions[1].definition.should eq 'the smelliest Epicodus teacher'
    end
  end

  describe '#edit_word' do
    it 'edits a word that already exists in the term' do
      test_term = Term.create('dog', 'definition of dog')
      test_term.edit_word('English', 'doggy')
      test_term.words[0].word.should eq 'doggy'
    end
  end

  describe '#edit_definition' do
    it 'edits a definition that already exists in the term' do
      test_term = Term.create('dog', 'definition of dog')
      test_term.edit_definition('English','four legged hairy creature')
      test_term.definitions[0].definition.should eq 'four legged hairy creature'
    end
  end

  describe '#delete_word' do
    it 'deletes a word from the current term' do
      test_term = Term.create('dog', 'definition of dog')
      test_term.add_word('perro', 'Spanish')
      test_term.delete_word('English')
      test_term.words.length.should eq 1
    end
  end

  describe '#delete_definition' do
    it 'deletes a definition from the current term' do
      test_term = Term.create('dog', 'definition of dog')
      test_term.add_definition('a spanish definicion', 'Spanish')
      test_term.delete_definition('English')
      test_term.definitions.length.should eq 1
    end
  end
end


