require 'open-uri'
require 'nokogiri'

def list_items(items)
  items.each_with_index do |item, index|
    status = item[:bought] ? "[X]" : "[ ]"

    puts "#{index + 1} - #{status} #{item[:name]}"
  end
end

def add_item(items)
  puts "Quel item veux-tu ajouter ?"
  item_name = gets.chomp
  items << { name: item_name, bought: false }
  list_items(items)
end

def delete_item(items)
  list_items(items)
  puts "Quel item veux-tu supprimer (Par ID) ?"
  user_choice = gets.chomp.to_i - 1
  deleted_item = items.delete_at(user_choice)

  puts "Bravo vous avez supprimé #{deleted_item}"
end

def mark_item(items)
  list_items(items)
  puts "Quel item veux-tu marquer (Par ID) ?"

  user_choice = gets.chomp.to_i - 1
  item = items[user_choice]
  item[:bought] = true
  puts "#{item[:name]} a bien été marqué"
end

def find_items(items)
  puts "Quel categorie ?"
  category = gets.chomp

  url = "https://www.etsy.com/fr/search?q=#{category}"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  items_from_etsy = html_doc.search('.v2-listing-card__info h2')

  items_from_etsy.each_with_index do |element, index|
    puts "#{index + 1} - #{element.text.strip[0..22]}"
  end

  puts "Quel item veux-tu ajouter (Par ID) ?"
  user_choice = gets.chomp.to_i - 1

  item_name = items_from_etsy[user_choice].text.strip[0..22]
  items << { name: item_name, bought: false }
  list_items(items)
end
