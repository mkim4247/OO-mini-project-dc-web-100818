class Users
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
      recipe_card.user == self
    end
  end

  def allergens
  allergic = Allergen.all.select do |allergen|
      allergen.user == self
    end
    allergic.collect do |allergen|
      allergen.ingredient
    end
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def recipes
    self.recipe_card.collect do |rc|
      rc.recipe
    end
  end

  def add_recipe_card(recipe_instance, date, rating)
    RecipeCard.new(self, recipe_instance, date, rating)
  end

  def top_three_recipes
    rc_rating = recipe_card.sort do |a, b|
      b.rating <=> a.rating
    end
      rc_rating.collect do |rc|
        rc.recipe
      end[0..2]
    end

  def most_recent_recipe
      recipes[-1]
  end

  def safe_recipes
    Recipes.all.select do |recipe|
      !recipe.ingredients.any? do |ing|
        self.allergens.include?(ing)
      end
    end
  end

end
