require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name
  # TODO: Add the name we just gotto the students array
  students << name if name != ""
end while name != ""
# tant que l'on ne tape pas enter

# TODO: Call `wagon_sort` method and display the sorted student list
new_students = wagon_sort(students)
puts "Congratulations! Your Wagon has #{students.count} students:"
new_students.to_s
puts new_students*", "