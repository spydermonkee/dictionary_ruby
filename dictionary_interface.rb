require './lib/dictionary'

def main_menu
  puts "Welcome to your dictionary."
  puts "What would you like to do?"
  puts "Press 'a' to add a new term to the dictionary"
  puts "Press 'e' to edit an existing word in the dictionary"
  puts "Press 'w' to add a new word to an existing term"
  puts "Press 'd' to add a new definition to an existing term"
  puts "Press 'l' to list all terms in your dictionary"
  puts "Press 'x' to exit your dictionary"

  main_choice = gets.chomp

  case main_choice
    when 'a'
      add_term
    when 'e'
      edit_term
    when 'w'
      add_word
    when 'd'
      add_definition
    when 'l'
      list_terms
  end
end

def add_term
  Puts "What is the word in the new term?"
    new_word = gets.chomp
  Puts "What is the definition of this new term?"
    new_definition = gets.chomp
  Term.create(new_word, new_definition)
  main_menu
end

main_menu
