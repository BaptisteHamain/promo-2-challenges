class Restaurant

  #TODO add relevant accessors if necessary
  attr_reader :city, :name, :average_rating

  def initialize(city, name)
    @city = city
    @name = name
    @average_rating = "No visitor has given a rating yet"
    @ratings = []

  end

  def rate(rating)
    @ratings << rating
    @average_rating = ratings.reduce(:+) / @ratings.length
  end

  #faire, refaire et re refaire l'exo ci-dessous => filtre
  def self.filter_by_city(restos, city) #.self transforme une méthode d'instance en méthode de classe
    city_resto = []
    restos.each do |resto|
      city_resto << resto if resto.city == city
    end
    city_resto
  end



  #TODO: implement #filter_by_city and #rate methods

end


#Interface
# restos = []
# restos << Restaurant.new['Paris', 'Chez bibi']
# restos << Restaurant.new['Caen', 'Chez toto']

# Restaurant.filter_by_city(restos, 'Caen')