class Recipes
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_card
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def add_ingredients(ingredient)
    RecipeIngredient.new(self, ingredient)
  end

  def users
    self.recipe_card.collect do |rc|
      rc.user
    end
  end

  def allergens
    arr_ing = Allergen.all.collect do |allergen|
      allergen.ingredient
    end
    arr_ing.select do |ing|
      self.ingredients.include?(ing)
    end
  end

  def recipe_ingredient
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def self.most_popular
    self.all.sort do |a, b|
      b.recipe_card.length <=> a.recipe_card.length
    end[0]
   end

  def ingredients
    recipe_ingredient.collect do |recipe_ingredient|
    recipe_ingredient.ingredient
   end
 end
end
