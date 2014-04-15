# Encoding: utf-8
require 'csv'

def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year
  array = []

  CSV.foreach(file_name, {encoding: "iso-8859-1:UTF-8"} ) do |row|

    info = {
      name: row[0],
      year: row[1].to_i,
      earnings: row[2].to_i
    }

    array << info
  end

  array.keep_if { |info| info[:year] < max_year }
  array.take(number)

end