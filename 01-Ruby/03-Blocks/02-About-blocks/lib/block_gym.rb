def tag(tag_name, attr = nil)
  if attr != nil
   attr_a = " #{attr[0]}=\'#{attr[1]}\'"
  else
   attr_a = ""
  end
  "<#{tag_name}#{attr_a}>#{yield}</#{tag_name}>"
end

puts tag("h1", ["id", "title" ]) {"Some Title"}

def timer_for
  beginning_time = Time.now
  yield
  end_time = Time.now
  time = end_time - beginning_time
end

def transform(element)
  yield element
end
