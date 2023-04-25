require_relative 'lib/database_connection'
require_relative 'lib/recipe_directory'

DatabaseConnection.connect('recipes_directory')
recipe_directory = RecipeDirectory.new

# prints all recipes
longest_string = 0

recipe_directory.all.each do |recipe|
  if recipe.name.length > longest_string
    longest_string = recipe.name.length
  end
end

recipe_directory.all.each do |recipe|
  puts "#{recipe.id}. #{recipe.name.ljust(longest_string)} - Cooking time: #{recipe.cooking_time.to_s.ljust(2)}, Rating: #{recipe.rating}"
end

# prints single recipe when searched by ID
puts "\nOutputting single recipe:"
recipe = recipe_directory.find_by_id(3)
puts "#{recipe.id}. #{recipe.name} - Cooking time: #{recipe.cooking_time.to_s.ljust(2)}, Rating: #{recipe.rating}"
