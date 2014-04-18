require_relative 'cookbook'

class Controller
  def initialize(file)
    # Here you should instantiate the Cookbook model with the file
    @cookbook = Cookbook.new(file)
  end

  def list_recipes
    @cookbook.recipes
  end

  def add_recipe(recipe)
    @cookbook.create(recipe)
  end

  def delete_recipe(index)
    recipe_to_delete = @cookbook.find(index)
    @cookbook.destroy(index)
    recipe_to_delete
  end
  # TODO: Implement the methods to retrieve, add, and delete recipes through the model
end

