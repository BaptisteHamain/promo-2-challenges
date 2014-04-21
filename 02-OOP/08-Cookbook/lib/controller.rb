require_relative 'cookbook'

class Controller
  def initialize(file)
    # Here you should instantiate the Cookbook model with the file
    @file = file
    @cookbook = Cookbook.new(file)
  end

  def list
    @cookbook.all
  end

  def add(recipe)
    @cookbook.create(recipe)
  end

  def delete(index)
    recipe_to_delete = @cookbook.find(index)
    @cookbook.destroy(index)
    recipe_to_delete
  end
end