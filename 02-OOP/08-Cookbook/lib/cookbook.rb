require 'csv'

class Cookbook

  attr_reader :recipes

  def initialize(file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    @file = file
    load_csv
  end

  # TODO: Implement the methods to retrieve all recipes, create, or destroy recipes
  # TODO: Implement a save method that will write the data into the CSV
  # And don't forget to use this save method when you have to modify something in your recipes array.
  def load_csv
    @recipes = []
    CSV.foreach(@file) { |row| @recipes << row.first }
  end

  def all
    @recipes
  end

  def create(name)
    @recipes << name
    save
  end


  def destroy(index)
    @recipes.delete_at(index)
    save
  end

  def save
    CSV.open(@file, 'w') do |csv|
      @recipes.each do |name|
        csv << [name]
      end
    end
  end

end