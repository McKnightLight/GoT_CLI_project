class API
  #BASE_URL = "https://anapioficeandfire.com/api/"
  def self.get_characters
    resp = RestClient.get('https://anapioficeandfire.com/api/characters/')
    got_hash = JSON.parse(resp.body, symbolize_names:true)
    #binding.pry
    got_hash.collect do | person |
      #binding.pry
      Characters.new(person)
    end
  end


  def self.get_character_details(character)
      resp = RestClient.get(character.url)
      char_hash = JSON.parse(resp.body, symbolize_names:true)
      character.name = char_hash[:name]
      character.culture = char_hash[:culture]
      character.titles = char_hash[:titles]
      character.aliases = char_hash[:aliases]
      character.playedBy = char_hash[:playedBy]
      # character.gender = char_hash[:gender]
      # character.born = char_hash[:born]
      # character.died = char_hash[:died]
      # character.father = char_hash[:mother]
      # character.spouse = char_hash[:spouse]
      # character.allegiances = char_hash[:allegiances]
      # character.books = char_hash[:books]
      # character.povBooks = char_hash[:povBooks]
      # character.tvSeries = char_hash[:tvSeries]
  end


end


# class API
  
#   BASE_URL = "https://anapioficeandfire.com/api/"

#   def self.get_characters(next_page=nil)
#     response = nil 
#     if next_page
#       response = RestClient.get(next_page)
#     else
#       response = RestClient.get(BASE_URL)
#     end
#     data = JSON.parse(response)

#     got_hash = JSON.parse(response.body, symbolize_names:true)
#     #binding.pry
#     got_hash.collect do | person |
#       #binding.pry
#       Characters.new(person)
#     end
#   end

#   def self.get_character_details(characters)
#     response = RestClient.get(BASE_URL + "characters/")
#     char_hash = JSON.parse(response.body, symbolize_names:true)
#     characters.culture = char_hash[:culture]
#     characters.titles = char_hash[:titles]
#     characters.aliases = char_hash[:aliases]
#     characters.playedBy = char_hash[:playedBy]
#     characters.gender = char_hash[:gender]
#     characters.born = char_hash[:born]
#     characters.died = char_hash[:died]
#     characters.mother = char_hash[:mother]
#     characters.father = char_hash[:father]
#     characters.spouse = char_hash[:spouse]
#     characters.allegiances = char_hash[:allegiances]
#     characters.books = char_hash[:books]
#     characters.povBooks = char_hash[:povBooks]
#     characters.tvSeries = char_hash[:tvSeries]
#   end
# end