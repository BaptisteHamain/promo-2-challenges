require_relative 'ui'
require_relative 'controller'

cookbook_controller = Controller.new(File.dirname(__FILE__) + "/recipes.csv")
cookbook_ui = UI.new(cookbook_controller)

cookbook_ui.display
