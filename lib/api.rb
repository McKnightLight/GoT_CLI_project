class API
  
  BASE_URL = "https://anapioficeandfire.com/api/"

  def self.get_characters
    response = RestClient.get(BASE_URL + "characters/")
    data = JSON.parse(response)

    data["results"].each do |characters_data|
      name = characters_data["name"]

    end
    #binding.pry 
    #resp = RestClient.get('https://anapioficeandfire.com/api/')
    #binding.pry
    #got_hash = JSON.parse(response.body, symbolize_names:true)
    #got_arr = got_hash[:results]
    #binding.pry
    #got_arr.collect do | person |
      #binding.pry
      #Characters.new(person)
    #end
  end

  def self.get_character_details(characters)
    response = RestClient.get(BASE_URL + "characters/")
    char_hash = JSON.parse(response.body, symbolize_names:true)
    characters.culture = char_hash[:culture]
    characters.titles = char_hash[:titles]
    characters.aliases = char_hash[:aliases]
    characters.playedBy = char_hash[:playedBy]
  end
end