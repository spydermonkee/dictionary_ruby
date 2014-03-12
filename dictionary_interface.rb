require './lib/dictionary'
require 'pry'

def main_menu
  puts "Welcome to your dictionary."
  puts "What would you like to do?"
  puts "Press 'a' to add a new term to the dictionary"
  puts "Press 'v' to view a term"
  puts "Press 'x' to exit your dictionary"

  main_choice = gets.chomp

  case main_choice
    when 'a'
      add_term
    when 'v'
      puts 'Which word would you like to find the term for?'
      search_word = gets.chomp
      view_a_term(search_word)
    when 'x'
      puts 'Thank you for your cooperation, Human.  Please have a pheasant day.'
    else
      puts 'Human, please enter one of the options given:'
      main_menu
  end
end

def add_term
  puts "What is the word in the new term?"
    new_word = gets.chomp
  puts "What is the definition of this new term?"
    new_definition = gets.chomp
  Term.create(new_word, new_definition)
  main_menu
end

def view_a_term(search_word)
  Term.terms.each do |term|
    term.words.each do |word|
      if word.word == search_word
        term.words.each do |word|
          puts "#{word.word} Language:#{word.language}\n"

        end
        term.definitions.each do |definition|
          puts "#{definition.definition} Language:#{definition.language}\n\n"
        end

        puts "Press 'ew' to edit an existing word"
        puts "Press 'ed' to edit an existing definition"
        puts "Press 'aw' to add a new word to an existing term"
        puts "Press 'ad' to add a new definition to an existing term"
        puts "Press 'mm' to go back to the main menu"
        view_input = gets.chomp

        case view_input
        when 'ew'
          puts 'What is the language of the word you would like to change?:'
          search_language = gets.chomp
          puts 'What would you like to change the word to?:'
          new_word = gets.chomp
          term.edit_word(search_language, new_word)
          main_menu
        when 'ed'
          puts 'What is the language of the definition you would like to change?:'
          search_language = gets.chomp
          puts 'What would you like to change the definition to?:'
          new_definition = gets.chomp
          term.edit_definition(search_language, new_definition)
          main_menu
        when 'aw'
          puts 'What language is the word you would like to add?:'
          language = gets.chomp
          puts 'What is the word you would like to add?:'
          word = gets.chomp
          term.add_word(word, language)
          main_menu
        when 'ad'
          puts 'What language is the definition you would like to add?:'
          language = gets.chomp
          puts 'What is the definition you would like to add?:'
          definition = gets.chomp
          term.add_definition(definition, language)
          main_menu
        when 'mm'
          main_menu
        else
          "That option does not compute, Human.  Please choose again:"
          view_a_term
        end
      else
        puts 'The word was not found within my mega brain.'
        main_menu
      end
    end
  end
end


main_menu
