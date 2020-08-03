require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.find {|x| x[:item] == name}
end

def consolidate_cart(cart)
  new_cart = []
  cart.each do |item|
    item_data = find_item_by_name_in_collection(item[:item], cart)
    item_data[:count] = cart.count {|item| item[:item] == item_data[:item]}
    new_cart << item_data
  end
  new_cart
end