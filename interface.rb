def list_items
  # afficher chacun des item
  puts "> TODO: list items"
end

def add_item
  # demander lequel
  # l'ajouter dans notre liste d'items
  # relister les items
  puts "> TODO: add item"
end

def delete_item
  # demander lequel
  # retirer de notre liste d'items
  # relister les items
  puts "> TODO: delete item"
end

puts "Welcome to your Christmas gift list"
user_action = nil

while user_action != 'quit'
  puts "> Which action [list|add|delete|quit]?"

  user_action = gets.chomp

  case user_action
  when 'list' then list_items
  when 'add' then add_item
  when 'delete' then delete_item
  when 'quit' then break
  else
    puts "Wrong Action"
  end
end

puts "BYEBYE"
