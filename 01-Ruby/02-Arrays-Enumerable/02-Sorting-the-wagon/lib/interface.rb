require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name

  students << name if name != ""

end while name != ""

students = wagon_sort(students)

puts "Congratulations! Your Wagon has #{students.size} students:"
if students.size >= 2
  puts "#{students[0..-2].join(', ')} and #{students.last}"
else
  puts students.first
end
