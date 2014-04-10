# Very dirty code to make some dirty gym...
def hop_hop_hop(number_of_exercises)
  for i in (1..number_of_exercises) do
    counter = 0
    until counter == i do
      print "hop! "
      counter += 1
    end
      print 'One more time..' + "\n"
  end
end

hop_hop_hop(6)