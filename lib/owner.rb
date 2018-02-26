require 'pry'

class Owner

  @@all = []
  attr_reader :species
  attr_accessor :pets, :name, :mood



  def initialize(species)
    @pets = {fishes: [], cats: [], dogs: []}
    @mood = mood
    @species = species
    @@all << self
  end



  def self.count
    @@all.count
  end

  def say_species
    return "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end



  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end


  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def self.mood=(mood)
    @mood = mood
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}

  end

  def feed_fish
    pets[:fishes].each { |fish| fish.mood = "happy"}
  end

  def sell_pets
    pets[:dogs].each {|dog| dog.mood = "nervous"}
    pets[:cats].each {|cat| cat.mood = "nervous"}
    pets[:fishes].each { |fish| fish.mood = "nervous"}
    pets.clear
  end

  def list_pets
    fish_count = pets[:fishes].count
    dog_count = pets[:dogs].count
    cat_count = pets[:cats].count
    return  "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
