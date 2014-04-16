class OrangeTree
 # TODO: Implement all the specs defined in the README.md :)
  def initialize
    @fruits = 0
    @age = 0
    @height = 0
    @fruit_count = 0
  end

  attr_reader :height, :age, :height, :fruit_count

 # Age en fonction du temps qui passe
  def one_year_passes!
    fruit_count = 0
    @age += 1
  end

  # Définition d'un arbre qui vit ou non
  def dead?
    if @age <= 50
      false
    else
      true
    end
  end

 # Définition de l'arbre qui grandit de 1m jusqu'à 10 ans
  def height
    if @age < 10
      @height = @age
    else
      @height = 10
    end
  end

 # On définit ici le nombre de fruits par ans
 # Données par l'arbre en fonction de son age
  def fruits
    if @age.to_i.between?(6, 10)
      @fruits = 100 && @fruit_count = 100
    elsif @age.to_i.between?(10, 15)
      @fruits = 200 && @fruit_count = 200
    else
      @fruits = 0
    end
  end

#Définition sur le fait qu'une personne puisse prendre un fruit
  def pick_a_fruit!
    @fruit_count -= 1
  end
end