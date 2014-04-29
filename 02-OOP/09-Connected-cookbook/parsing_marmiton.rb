require 'open-uri'
require 'nokogiri'

puts "which ingredient ?"
ingredients = gets.chomp

response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredients}")

doc = Nokogiri::HTML(response) #:: signifie que l'on se situe dans le sous-module HTML de Nokogiri

doc.search('.m_search_result').each do |element|
  puts "#{element.search('.m_search_titre_recette > a').inner_text}"
  puts "Rating : #{element.search('.etoile1').size} / 5"
  puts "#{element.search('.m_search_nb_votes').inner_text}".match(/\d+/)
  puts element.search('.m_search_result_part4').inner_text.scan(/\d+/)[0]
  puts "#{element.search('.m_search_result_part4').inner_text}".scan(/\d+/)[1]
  puts "#{element.search('.m_search_result_part4').inner_text}".scan(/.{150}/)

end

