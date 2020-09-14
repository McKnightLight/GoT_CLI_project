class Characters
  
  attr_accessor :name, :url, :culture, :titles, :aliases, :playedBy
  
  @@all = []

  def initialize(name:, url:, culture:, titles:, aliases:, playedBy:)
    self.name = name
    self.url = url
    self.culture = culture
    self.titles = titles 
    self.aliases = aliases 
    self.playedBy = playedBy
  end 

  def self.all
    @@all << self 
  end
end