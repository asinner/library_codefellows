class Library
  attr_accessor :shelves
  
  # Make shelves attribute into array
  def initialize
    self.shelves = []
  end
  
  # Build a shelf for the library
  def new_shelf
    s = Shelf.new
    self.shelves.push(s)
    return s
  end

  # Get each book in the library
  def books
    
    # Empty books array
    books = []
    
    # Iterate through the shelves in the library
    self.shelves.each do |shelf|
      
      # Iterate through books on each shelf
      shelf.books.each do |book|
        
        # Put book into array
        books.push(book)
        
      end
      
    end
    
    return books;
    
  end


end

class Shelf
  attr_accessor :books
  
  # Make books attribute into array
  def initialize
    self.books = []
  end
end

class Book
  attr_accessor :shelf
  
  # Put the book on the shelf
  def enshelf(shelf)
    
    # Unshelf the book if it is on a shelf
    if self.shelf
      self.shelf.books.delete(self)
    end
    
    # Set the shelf attribute on the book
    self.shelf = shelf
    
    # Put the book on the shelf
    self.shelf.books.push(self)
    
    return self
    
  end
  
  # Unsehlf the book
  def unshelf
    if self.shelf
      self.shelf.books.delete(self)
      self.shelf = nil
    end
  end
end

# Create a new library
library = Library.new

# Create some shelves
popular = library.new_shelf
classic = library.new_shelf

# Create some books
b1 = Book.new
b2 = Book.new
b3 = Book.new

# Shelf the boooks
b1.enshelf(popular)
b2.enshelf(classic)
b3.enshelf(classic)

# Get the book on the popular shelf
print popular.books
print "\n Printed popular shelf books \n\n"

# Get the books on the classic shelf
print classic.books
print "\n Printed classic shelf books \n\n"

# Deshelf B3 from the classic shelf
b3.unshelf
print classic.books
print "\n Printed classic shelf books \n\n"

# Get all the books in the library
print library.books
print "\n Printed all books in library \n\n"
