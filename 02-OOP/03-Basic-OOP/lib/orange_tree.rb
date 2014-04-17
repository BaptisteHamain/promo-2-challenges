class OrangeTree
  attr_reader :height, :fruits

  def initialize
    @fruits = 0
    @height = 0
    @age = 0
    @dead = false
  end

 # Age en fonction du temps qui passe
  def one_year_passes!
    unless dead?
      grow_up
      grow_fruits
      may_die?
    end

    @age += 1
  end

 #Définition sur le fait qu'une personne puisse prendre un fruit
  def pick_a_fruit!
    @fruits = @fruits - 1 if @fruits > 0
  end


  def dead?
    @dead
  end

  private

# Définition de l'arbre qui grandit de 1m jusqu'à 10 ans
    def grow_up
      @height += 1 if can_still_grow_up?
    end

    def can_still_grow_up?
      @age < 10
    end

 # On définit ici le nombre de fruits par ans
 # Données par l'arbre en fonction de son age
    def grow_fruits
      @fruits = 0  # Fruits fall off

      if @age >= 5 && @age < 10
        @fruits = 100
      elsif @age >= 10 && @age < 15
        @fruits = 200
      end
    end

# Définition d'un arbre qui vit ou non
    def may_die?
      if @age >= 100
        @dead = true
      elsif @age >= 50
        @dead = rand(10) == 0 # 10% of chance to die
      end
    end
end
