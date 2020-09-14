class CLI
  def run
    puts "Hello! Welcome to An API of Ice and Fire!"
    puts "Time can be tricky in Westeros. Please hold while we search the Seven Kingdoms for your favorite characters..."
    API.scrape_characters
    list_characters
    menu
  end

  def list_characters
    Character.all.each.with_index(1) do | character, i | 
      puts "#{i}. #{character.name}"
    end
  end

  def menu
    puts "Please select the number of a character."
    #puts "Type 'Bran' to give up."
    input = gets.chomp
    if !input.to_i.between?(1, Character.all.count)
      puts "A character has no name. Please try again."
      list_characters
      menu
    elsif
      character = Character.all[input.to_i-1]
      display_character_details(character)
    #else 
      #input == Bran
      #puts "Like Rob Stark, you left us too soon."
      #puts "Goodbye!"
      #exit
    end
    puts "Would you like to try another character?"
    puts "Please enter Y or N"
    another_character = gets.strip.downcase
    if another_character == "y"
      list_characters
      menu 
    elsif another_character == "n"
      puts "We will miss you like we miss Ned Stark!"
      exit
    else 
      puts "Was that a typo with your Little Finger?"
      list_characters 
      menu 
    end
  end

  def display_character_details(character)
    API.scrape_character_details(character)
    puts "Here is what we know about #{character.name}:"
    puts "Culture: #{character.culture}"
    puts "Titles: #{character.titles}"
    puts "Aliases: #{character.aliases}"
    puts "Played By: #{character.playedBy}"
  end
end