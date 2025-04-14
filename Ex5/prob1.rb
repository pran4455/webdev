require 'date'

# Base class for Library Items
class LibraryItem
  attr_accessor :title, :author, :publication_year

  def initialize(title, author, publication_year)
    @title = title
    @author = author
    @publication_year = publication_year
  end

  # Default due date method (14-day loan period)
  def due_date
    Date.today + 14
  end
end

# Subclass for Books
class Book < LibraryItem
  attr_accessor :isbn, :number_of_pages

  def initialize(title, author, publication_year, isbn, number_of_pages)
    super(title, author, publication_year)
    @isbn = isbn
    @number_of_pages = number_of_pages
  end
end

# Subclass for DVDs
class DVD < LibraryItem
  attr_accessor :running_time, :genre

  def initialize(title, author, publication_year, running_time, genre)
    super(title, author, publication_year)
    @running_time = running_time
    @genre = genre
  end

  # Override due_date method for shorter loan period (7-day loan period)
  def due_date
    Date.today + 7
  end
end

# Subclass for Magazines
class Magazine < LibraryItem
  attr_accessor :issue_number, :publisher

  def initialize(title, author, publication_year, issue_number, publisher)
    super(title, author, publication_year)
    @issue_number = issue_number
    @publisher = publisher
  end
end

# Creating instances of different library items
book = Book.new("The Great Gatsby", "F. Scott Fitzgerald", 1925, "978-0743273565", 180)
dvd = DVD.new("Inception", "Christopher Nolan", 2010, 148, "Science Fiction")
magazine = Magazine.new("National Geographic", "Various", 2023, 120, "NatGeo Publishing")

# Demonstrating access to attributes
puts "Book: #{book.title}, ISBN: #{book.isbn}, Due Date: #{book.due_date}"
puts "DVD: #{dvd.title}, Genre: #{dvd.genre}, Due Date: #{dvd.due_date}"
puts "Magazine: #{magazine.title}, Publisher: #{magazine.publisher}, Due Date: #{magazine.due_date}"
