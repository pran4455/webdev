require 'date'

# Base class for Products
class Product
  attr_accessor :name, :price, :description

  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end

  # Default discount method (10% discount)
  def discount
    @price * 0.90
  end
end

# Subclass for Books
class Book < Product
  attr_accessor :author, :isbn

  def initialize(name, price, description, author, isbn)
    super(name, price, description)
    @author = author
    @isbn = isbn
  end

  # Override discount method for books (15% discount)
  def discount
    @price * 0.85
  end
end

# Subclass for Clothing
class Clothing < Product
  attr_accessor :size, :color

  def initialize(name, price, description, size, color)
    super(name, price, description)
    @size = size
    @color = color
  end

  # Override discount method for clothing (20% discount)
  def discount
    @price * 0.80
  end
end

# Creating instances of different product types
book = Book.new("Ruby Programming", 50, "A comprehensive guide to Ruby.", "David Flanagan", "978-1449372651")
clothing = Clothing.new("T-Shirt", 20, "Cotton T-shirt", "M", "Blue")

# Demonstrating access to attributes
puts "Book: #{book.name}, Author: #{book.author}, Price after Discount: $#{book.discount}"
puts "Clothing: #{clothing.name}, Size: #{clothing.size}, Price after Discount: $#{clothing.discount}"
