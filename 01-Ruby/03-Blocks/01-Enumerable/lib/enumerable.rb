def sum_odd_indexed(array)
  sum = 0
  array.each_with_index do |item, index|
    sum += item if index.odd?
  end
  sum
end

def even_numbers(array)
  array.select { |num|  num.even?  }
end

def short_words(array, max_length)
  array.reject { |word| word.length > max_length }
end

def first_under(array, limit)
  # TODO: Return the first number from an array that is less than limit.
  #       You should use Enumerable#find
  array.find { |number| number < limit }
end

def add_bang(array)
  array.map { |item| item + "!" }
end

def product(array)
  array.reduce(1, :*)
end

def sorted_pairs(array)
  array2 = []
  array.each_slice(2) {|a| array2 << a.sort }
  array2
end
