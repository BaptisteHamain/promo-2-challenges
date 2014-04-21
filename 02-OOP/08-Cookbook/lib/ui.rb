class UI

  TASKS = {
    list: "- List all recipes [list]",
    add:  "- Add a new recipe [add]",
    del:  "- Delete a recipe [del]",
    exit: "- Exit [exit]"
  }

  def initialize(controller)
    @controller = controller
    @running = true
  end

  def list
    @controller.list.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe} (miam)"
    end
  end

  def add
    puts "which recipe do you want to add?"

    recipe = gets.chomp

    @controller.add(recipe)

    puts "the recipe #{recipe} has been added"

    # TODO: ask the user a recipe name
    # TODO: call the appropriate controller method with the proper argument(s)
  end

  def del
    puts "which recipe do you want to delete (enter the <id>)?"

    index = gets.chomp.to_i

    deleted_recipes = @controller.delete(index - 1)

    puts "the recipe #{deleted_recipes} has been deleted"

    # TODO: ask the user a recipe index
    # TODO: call the appropriate controller method with the proper argument(s)
  end

  def exit
    @running = false
    puts "Goodbye, my dear friend."
  end

  def user_input
    gets.chomp
    # TODO: Get the user input and return it
    # [OPTIONAL] You can think of the case where the user
    # enters a wrong choice.
  end

  def display
    puts "-- Welcome to the CookBook --"

    while @running
      print "\n"

      display_tasks
      dispatch(user_input)

      print "\n"
    end
  end

  ###
  ##  You don't need to modify the following methods !
  ###
  def display_tasks
    puts "What do you want to do? \n"
    puts TASKS.values
  end

  # The dispatch method takes a String or a Symbol as an argument
  # and calls the method with the same name.
  #
  #  Examples:
  #
  #   dispatch(:del) => Will call the `del` method in the current class
  #   dispatch("add") => Will call the `add` method in the current class
  #
  # To understand this, read the doc : http://ruby-doc.org/core-2.1.1/Object.html#method-i-send
  def dispatch(task)
    self.send(task.to_sym)
  end
end
