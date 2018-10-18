require_relative '../config/environment.rb'

user1 = Users.new("Mike")
user2 = Users.new("Caroline")
user3 = Users.new("Beth")
user4 = Users.new("Iman")

recipe1 = Recipes.new("Strawberry SC")
recipe2 = Recipes.new("Fudge")
recipe3 = Recipes.new("Brownie")
recipe4 = Recipes.new("Cake")

ing1 = Ingredients.new("flour")
ing2 = Ingredients.new("egg")
ing3 = Ingredients.new("water")
ing4 = Ingredients.new("vanilla ext")


rc1 = RecipeCard.new(user1, recipe1, "Jan 1", 3)
rc2 = RecipeCard.new(user2, recipe2, "Feb 2", 4)
rc3 = RecipeCard.new(user3, recipe3, "March 4", 3.5)
rc4 = RecipeCard.new(user4, recipe4, "Dec 5", 5)
rc5 = RecipeCard.new(user4, recipe4, "Dec 5", 5)

ri1 = RecipeIngredient.new(recipe1, ing1)
ri2 = RecipeIngredient.new(recipe2, ing2)
ri3 = RecipeIngredient.new(recipe3, ing3)
ri4 = RecipeIngredient.new(recipe4, ing4)

al1 = Allergen.new(user1, ing1)
al2 = Allergen.new(user2, ing2)
al3 = Allergen.new(user3, ing3)
al4 = Allergen.new(user4, ing1)


binding.pry
