class API
  def self.get_characters
    resp=RestClient.get('https://anapioficeandfire.com/api/')
    binding.pry
    got_hash = JSON.parse(resp.body, symbolize_names:true)
    got_arr = got_hash[:results]
    got_arr.collect do |person|
      character.new(person)
    end
  end

  def self.get_characters details(character)
    resp = RestClient.get(character.url)
    char_hash = JSON.parse(resp.body, symbolize_names:true)
    character.culture = char_hash[:culture]
    character.titles = char_hash[:titles]
    character.aliases = char_hash[:aliases]
    character.playedBy = char_hash[:playedBy]
  end
end