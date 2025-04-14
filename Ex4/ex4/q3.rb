"""
You are tasked with creating a Ruby program to manage a library system using hashes.
The program should allow users to store, modify, and retrieve book information efficiently.
The program should provide options to:
    o Add a new book to the library.
    o Update the number of copies available for an existing book.
    o Remove a book from the library using its ISBN.
    o Search for a book by ISBN and display its details.
    o List all books in the library with their details.
"""

class Library
    def initialize
      @books = {
        "978-0143127741" => { title: "The Alchemist", author: "Paulo Coelho", copies: 5 },
        "978-0062315007" => { title: "Sapiens", author: "Yuval Noah Harari", copies: 3 },
        "978-0451524935" => { title: "1984", author: "George Orwell", copies: 4 }
      }
    end
  
    def add_book
      print "Enter ISBN: "
      isbn = gets.chomp
      print "Enter book title: "
      title = gets.chomp
      print "Enter author's name: "
      author = gets.chomp
      print "Enter number of copies: "
      copies = gets.chomp.to_i
  
      @books[isbn] = { title: title, author: author, copies: copies }
      puts "\nNew book added successfully!\n"
    end
  
    def update_copies
      print "Enter ISBN to update copies: "
      isbn = gets.chomp
      if @books.key?(isbn)
        print "Enter new number of copies: "
        new_copies = gets.chomp.to_i
        @books[isbn][:copies] = new_copies
        puts "\nBook copies updated successfully!\n"
      else
        puts "\nBook not found!\n"
      end
    end
  
    def remove_book
      print "Enter ISBN to remove: "
      isbn = gets.chomp
      if @books.delete(isbn)
        puts "\nBook removed successfully!\n"
      else
        puts "\nBook not found!\n"
      end
    end
  
    def search_book
      print "Enter ISBN to search: "
      isbn = gets.chomp
      if @books.key?(isbn)
        book = @books[isbn]
        puts "\n**Book Details**"
        puts "------------------------------------------"
        puts "Title       : #{book[:title]}"
        puts "Author      : #{book[:author]}"
        puts "Copies Left : #{book[:copies]}"
        puts "------------------------------------------\n"
      else
        puts "\nBook not found!\n"
      end
    end
  
    def list_books
      puts "\n**Library Catalog**"
      puts "------------------------------------------------------------"
      puts "| ISBN             | Title               | Author            | Copies |"
      puts "------------------------------------------------------------"
      @books.each do |isbn, book|
        puts "| #{isbn.ljust(16)} | #{book[:title].ljust(18)} | #{book[:author].ljust(16)} | #{book[:copies].to_s.ljust(6)} |"
      end
      puts "------------------------------------------------------------\n"
    end
  end
  
  # Program Execution
  library = Library.new
  
  loop do
    puts "\n**Library Management System**"
    puts "1 Add Book"
    puts "2 Update Book Copies"
    puts "3 Remove Book"
    puts "4 Search for a Book"
    puts "5 List All Books"
    puts "6 Exit"
    print "🔹 Choose an option: "
  
    choice = gets.chomp.to_i
  
    case choice
    when 1
      library.add_book
    when 2
      library.update_copies
    when 3
      library.remove_book
    when 4
      library.search_book
    when 5
      library.list_books
    when 6
      puts "\nExiting program. Goodbye!\n"
      break
    else
      puts "\nInvalid option, please try again.\n"
    end
  end
  