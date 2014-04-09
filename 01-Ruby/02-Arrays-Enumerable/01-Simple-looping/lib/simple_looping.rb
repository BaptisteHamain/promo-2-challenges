def sum_with_while(min,max)
  #TODO: return the sum of the integers between min and max
  #CONSTRAINT: you should use a while..end structure
  # conseil : on peut écrire la méthode "vide" au départ, puis écrire intérieur
  sum = 0
  #penser à tjs mettre une variable qui vaut 0
  #on fait une boucle qui va calculer par étape jusqu'à arriver au max
  x = min
   while x <= max
    sum += x
    x += 1
   end
  sum
end

def sum_with_for(min,max)
  #TODO: return the sum of the integers between min and max
  #CONSTRAINT: you should use a for..end structure
   sum = 0
   for i in min..max #= i va s'executer entre min et max dans la méthode
     sum += i
   end
  sum                #la boucle redémarre
end

def sum_recursive(min,max)
  #TODO (optional): return the sum of the integers between min and max
  #CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
  #recursion = s'appeler soit même à l'intérieur de sa méthode

    if min == max
     max

    else
     min + sum_recursive(min+1,max)
    end
end

