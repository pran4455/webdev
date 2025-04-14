class VendingMachine
    PRODUCTS = {
      1 => { name: "Soda", price: 1.50 },
      2 => { name: "Chips", price: 1.00 },
      3 => { name: "Candy", price: 0.75 }
    }
  
    def initialize
      @running = true
    end
  
    def start
      puts "Welcome to the Vending Machine!"
      while @running
        display_products
        product = select_product
        next unless product
  
        quantity = get_quantity
        total_price = product[:price] * quantity
  
        money_inserted = collect_money(total_price)
        if money_inserted
          change = (money_inserted - total_price).round(2)
          display_summary(product, quantity, total_price, change)
        end
  
        break unless continue_shopping?
      end
  
      puts "Thank you for using the Vending Machine! Goodbye!"
    end
  
    private
  
    def display_products
      puts "\nAvailable Products:"
      PRODUCTS.each do |number, details|
        puts "#{number}. #{details[:name]} - $#{'%.2f' % details[:price]}"
      end
      puts "4. Cancel"
    end
  
    def select_product
      loop do
        print "\nSelect a product by entering the number (1-3) or 4 to cancel: "
        choice = gets.chomp.to_i
        if choice == 4
          puts "Transaction canceled. Returning to main menu."
          return nil
        elsif PRODUCTS.key?(choice)
          return PRODUCTS[choice]
        else
          puts "Invalid selection. Please try again."
        end
      end
    end
  
    def get_quantity
      loop do
        print "Enter the quantity you want to purchase: "
        quantity = gets.chomp.to_i
        return quantity if quantity > 0
  
        puts "Invalid quantity. Please enter a positive number."
      end
    end
  
    def collect_money(total_price)
      money_inserted = 0.0
  
      while money_inserted < total_price
        remaining = (total_price - money_inserted).round(2)
        print "Please insert $#{'%.2f' % remaining}: "
        input = gets.chomp
  
        if input.downcase == "cancel"
          puts "Transaction canceled. Returning $#{'%.2f' % money_inserted}."
          return nil
        end
  
        inserted = input.to_f
        if inserted > 0
          money_inserted += inserted
        else
          puts "Invalid amount. Please insert a positive value."
        end
      end
  
      money_inserted.round(2)
    end
  
    def display_summary(product, quantity, total_price, change)
      puts "\nTransaction Summary:"
      puts "Product: #{product[:name]}"
      puts "Quantity: #{quantity}"
      puts "Total Paid: $#{'%.2f' % total_price}"
      puts "Change Returned: $#{'%.2f' % change}" if change > 0
    end
  
    def continue_shopping?
      print "\nWould you like to make another purchase? (yes/no): "
      gets.chomp.downcase == "yes"
    end
  end
  
  # Start the vending machine
  VendingMachine.new.start
  