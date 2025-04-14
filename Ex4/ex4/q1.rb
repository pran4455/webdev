"""
You are designing an e-commerce shopping cart system that allows users to add multiple
products. Each product is represented as [product_name, quantity, price] in an array.
"""

def calculate_total(cart)
    total = 0
    cart.each do |product|
      name, quantity, price = product
      item_total = quantity * price
  
      if quantity > 5
        item_total *= 0.9
      end
  
      total += item_total
    end
    return "Final total: $#{total.round(2)}"
  end
  
  cart = [["Smartphone", 2, 1000], ["Tablet", 7, 300], ["Keyboard", 6, 40], ["Monitor", 4, 150]]
  puts calculate_total(cart)
