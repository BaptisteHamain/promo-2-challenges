require "csv"

class Cookbook

  attr_reader :recipes

  def initialize(file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    @file = file
    load_csv(file)
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save(recipe)
  end

  def destroy(index)
    @recipes.delete_at(index)
    save(index)
  end

  # TODO: Implement a save method that will write the data into the CSV
  def save(recipe)
    CSV.open(@file, "w") do |csv|
        csv << [recipe]
    end
  end

  # And don't forget to use this save method when you have to modify something in your recipes array.

  private

  def load_csv(file)
    @recipes = []
    CSV.foreach(file) do |row|
      @recipes << row.first
    end
  end

end