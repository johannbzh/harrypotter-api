require 'open-uri'
require 'nokogiri'

puts "Creating characters..."

dictio = ("A".."Z").to_a
dictio.each do |let|
  url = "https://www.hp-lexicon.org/character/?letter=#{let}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  links = html_doc.css('a')
  hrefs = links.map { |e| e.attribute('href').to_s}.uniq.sort.delete_if {|href| href.empty?}.select{|e| e.include?("https://www.hp-lexicon.org/character/")}.each do |element|
    html_file_child = URI.open(element).read
    html_doc_child = Nokogiri::HTML(html_file_child)
    html_doc_child.search('.fact_box').each do |element|
      element.search('.header').nil? ? name = "" : name = element.search('.header').text.strip
      Character.create(name: name)
    end
  end
  puts "Letter A characters have been created!"
end
