class CLI
  def run
    puts "Hello! Welcome to the Game of Thrones Character Search!"
    puts "Consulting the Three-Eyed Raven to find your favorite characters."
    #binding.pry
    API.get_characters
    list_characters
    menu
  end

  def list_characters
    Characters.all.each.with_index(1) do | characters, i | 
      puts "#{i}. #{characters.name}"
    end
  end

  def menu
    puts "Please enter the number of a character to pull up their details."
    puts "Or type 'Bran' to give up."
    input = gets.chomp.downcase
    if 
      input == "bran"
      puts "We understand. It's not how we wanted things to end, either."
      #countdown?
      puts "Goodbye!"
      exit
    elsif !input.to_i.between?(1, Characters.all.count)
      puts "A character has no name."
      puts "Please try again."
      list_characters
      menu
    elsif
      characters = Characters.all[input.to_i-1]
      display_character_details(characters)
    end
    puts "Would you like to view another character?"
    #puts "Would you like to see the next page of characters?"
    #puts "Would you like to see only main characters?"
    puts "Please enter Y or N"
    another_character = gets.strip.downcase
    if another_character == "y"
      list_characters
      menu 
    elsif another_character == "n"
      puts "Like Ned Stark, you left us too soon."
      puts "Goodbye!"
      exit
    else
      puts "Was that a typo with your Little Finger?"
      puts "Please try again."
      list_characters
      menu
    end
  end

  def display_character_details(characters)
    API.get_character_details(characters)
    puts "Here is what we know about #{characters.name.upcase}:"
    puts "Culture: #{characters.culture}"
    puts "Titles: #{characters.titles}"
    puts "Aliases: #{characters.aliases}"
    puts "Played By: #{characters.playedBy}"
    puts "Gender: #{characters.gender.downcase}"
    puts "Born: #{characters.born}"
    puts "Died: #{characters.died}"
    puts "Father: #{characters.father}"
    puts "Mother: #{characters.mother}"
    puts "Spouse: #{characters.spouse}"
    puts "Books: #{characters.books}"
    puts "Point of View: #{characters.povBooks}"
    puts "TV Series: #{characters.tvSeries}"
  end
end