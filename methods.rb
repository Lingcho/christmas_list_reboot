def list_items(items)
  items.each_with_index do |item, index|
    status = item[:bought] ? "[X]" : "[ ]"

    puts "#{index + 1} - #{status} #{item[:name]}"
  end
end

def add_item(items)
  # demander lequel
  puts "Quel item veux-tu ajouter ?"
  item = gets.chomp
  # l'ajouter dans notre liste d'items
  items << item

  list_items(items)
end

def delete_item(items)
  list_items(items)
  # Afficher la liste
  # demander lequel
  puts "Quel item veux-tu supprimer (Par ID) ?"
  # retirer de notre liste d'items
  user_choice = gets.chomp.to_i - 1
  # relister les items
  deleted_item = items.delete_at(user_choice)

  puts "Bravo vous avez supprimé #{deleted_item}"
end

def mark_item; end
