require_relative 'methods'

items = [
  { name: 'Mousse à raser', bought: true },
  { name: 'chaussetes', bought: false }
]

puts "Welcome to your Christmas gift list"
user_action = nil

while user_action != 'quit'
  puts "> Which action [list|add|delete|quit]?"

  user_action = gets.chomp

  case user_action
  when 'list' then list_items(items)
  when 'add' then add_item(items)
  when 'delete' then delete_item(items)
  when 'mark' then mark_item
  when 'quit' then break
  else
    puts "Wrong Action"
  end
end

puts "BYEBYE"
