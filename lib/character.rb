class Character
  @@all = []
  
  attr_accessor :name, :url, :culture, :titles, :aliases, :playedBy

  def initialize(person)
    self.name = person[:name]
    self.url = person[:url]
    @@all << self 
  end

  def self.all
    @@all 
  end

end