def wagon_sort(students)
  # TODO: return a copy of students, sorted alphabetically
  students.sort_by{|name| name.downcase}
end
