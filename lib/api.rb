class API
  #BASE_URL = "https://anapioficeandfire.com/api/"
  def self.get_characters
    resp = RestClient.get('https://anapioficeandfire.com/api/characters?page=20&pageSize=30')
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
      character.gender = char_hash[:gender]
      character.born = char_hash[:born]
      character.died = char_hash[:died]
      character.father = char_hash[:mother]
      character.spouse = char_hash[:spouse]
      character.allegiances = char_hash[:allegiances]
      character.books = char_hash[:books]
      character.povBooks = char_hash[:povBooks]
      character.tvSeries = char_hash[:tvSeries]
  end


end