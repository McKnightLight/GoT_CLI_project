class Characters
  
  attr_accessor :name, :url, :culture, :titles, :aliases, :playedBy, :gender, :born, :died, :father, :mother, :spouse, :allegiances, :books, :povBooks, :tvSeries
  
  @@all = []

  def initialize(person)
    self.name = person[:name]
    self.url = person [:url]
    @@all << self
  end

  # def initialize (name:, url:, culture:, titles:, aliases:, playedBy:, gender:, born:, died:, father:, mother:, spouse:, allegiances:, books:, povBooks:, tvSeries:)
  #   self.name = name
  #   self.url = url
  #   self.culture = culture
  #   self.titles = titles 
  #   self.aliases = aliases 
  #   self.playedBy = playedBy
  #   self.gender = gender
  #   self.born = born
  #   self.died = died 
  #   self.father = father
  #   self.mother = mother
  #   self.spouse = spouse 
  #   self.allegiances = allegiances
  #   self.books = books
  #   self.povBooks = povBooks
  #   self.tvSeries = tvSeries
  # end 

  def self.all
    @@all
  end
end