class Ingredients
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    arr = Allergen.all.collect do |allergen|
      allergen.ingredient
    end
    arr.max_by do |ing|
      arr.count(ing)
    end 
  end

end
