class Song
  attr_accessor :name
  @@all=[]

  def initialize
    save
  end
  
  def self.all 
    @@all 
  end 
  
  def save
    @@all<self
  end

  def self.reset_all
    @@all.clear
  end
  
end
