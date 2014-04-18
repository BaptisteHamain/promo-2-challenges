require "csv"

class Cookbook

  attr_reader :recipes

  def initialize(file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    @file = file
    load_csv(file)
  end

  def find(index)
    @recipes[index]
  end

  def create(recipe)
    @recipes << recipe
    CSV.open(@file, "a") do |csv|
        csv << [recipe]
    end
  end

  def destroy(index)

    @recipes.delete_at(index)

    CSV.open(@file, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe]
      end
    end

  end
  # TODO: Implement a save method that will write the data into the CSV
  # And don't forget to use this save method when you have to modify something in your recipes array.

  private

  def load_csv(file)
    @recipes = []
    CSV.foreach(file) do |row|
      @recipes << row.first
    end
  end

end