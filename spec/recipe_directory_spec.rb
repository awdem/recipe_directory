require 'recipe_directory'

def reset_recipes_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'recipes_directory_test'})
  connection.exec(seed_sql)
end

RSpec.describe RecipeDirectory do 
  before(:each) do
    reset_recipes_table
  end

  it "returns all the recipes" do
    repo = RecipeDirectory.new

    recipes = repo.all
    expect(recipes.length).to eq 5

    expect(recipes[0].id).to eq 1
    expect(recipes[0].name).to eq 'Pepperoni Pizza'
    expect(recipes[0].cooking_time).to eq 10
    expect(recipes[0].rating).to eq 5
    
    expect(recipes[-1].id).to eq 5
    expect(recipes[-1].name).to eq 'Microwave Meal'
    expect(recipes[-1].cooking_time).to eq 4
    expect(recipes[-1].rating).to eq 2
  end
  
  it "returns a single recipe when searched by ID" do
    repo = RecipeDirectory.new
    
    recipe = repo.find_by_id(3)
    
    expect(recipe.id).to eq 3
    expect(recipe.name).to eq 'Choriza and Broccoli Pasta'
    expect(recipe.cooking_time).to eq 15
    expect(recipe.rating).to eq 5
  end
end
