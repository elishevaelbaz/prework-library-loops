require 'pry'

library = [
  {title: "Dracula", author: "Bram Stoker", genres: ["Horror", "Gothic"], pages: 418, publication_year: 1897, completed: true},
  {title: "Slaughterhouse Five; or the Children's Crusade", author: "Kurt Vonnegut, Jr.", genres: ["Satire", "Science Fiction"], pages: 186, publication_year: 1969, completed: false},
  {title: "Frankenstein; or, the Modern Prometheus", author: "Mary Shelley", genres: ["Gothic", "Horror", "Science Fiction"], pages: 280, publication_year: 1818, completed: true},
  {title: "Circe", author: "Madeline Miller", genres: ["Historical Fiction", "Fantasy"], pages: 385, publication_year: 2018, completed: false},
  {title: "Inferno", author: "Dante Alighieri", genres: ["Epic"], pages: 261, publication_year: 1320, completed: true},
  {title: "Mastering the Art of French Cooking", author: "Simone Beck, Louisette Bertholie, Julia Child", genres: ["Cooking"], pages: 726, publication_year: 1961, completed: false},
  {title: "Animal Farm", author: "George Orwell", genres: ["Political Satire"], pages: 112, publication_year: 1945, completed: true},
  {title: "War and Peace", author: "Leo Tolstoy", genres: ["Historical Fiction"], pages: 1225, publication_year: 1869, completed: false},
  {title: "The Innovators: How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution", author: "Walter Isaacson", genres: ["Biography"], pages: 488, publication_year: 2014, completed: false},
  {title: "Twilight", author: "Stephanie Meyer", genres: ["Young Adult", "Fantasy", "Romance"], pages: 498, publication_year: 2005, completed: true},
  {title: "The Life of Washington", author: "Mason Weems", genres: ["Historical Fiction", "Biography"], pages: 264, publication_year: 1809, completed: false},
  {title: "The Travels of John Mandeville", author: "John Mandeville", genres: ["Historical Fiction", "Fantasy"], pages: 167, publication_year: 1371, completed: false},
  {title: "Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Sugeon, and tthen a Captain of Several Ships", author: "Jonathan Swift", genres: ["Political Satire", "Fantasy"], pages: 240, publication_year: 1726, completed: true}
]

# WRITE CODE BELOW HERE

def all_pages(array)
  sum = 0
  array.each do |book|
    sum += book[:pages]
  end
  puts sum
  # array.reduce {|book| book[:pages]}
  # array.each {|book| puts book[:pages].class}
end


def all_pages_read(array)
  sum = 0
  array.each do |book|
    if book[:completed]
      sum += book[:pages]
    end
  end
  sum
end

def all_genres(array)
  array.map do |book|
    book[:genres]
  end.flatten.uniq
end

def books_read(array)
  array.select {|book| book[:completed] == true}
end


def completed_books_detail(array)
  num_books = books_read(array).count
  num_pages = all_pages_read(array)
  puts "I've read #{num_books} books, totaling at #{num_pages} pages"
end

def books_in_library(array)
  array.map do |book|
    "#{book[:title]} by #{book[:author]}"
  end
end

def books_by_year(array)
  array.sort_by { |book| book[:publication_year]}
end

def books_with_subtitles(array)
  array.select {|book| book[:title].include?(";")}
end

def books_primary_title(array)
  array.map do |book|
    book[:title].split(";").first

  end
end

def highest_page_count(array)
  page_count = 0
  longest_book = ""
  # array.reduce do 
  array.each do |book|
    if book[:pages] > page_count
      page_count = book[:pages]
      longest_book = book
    end
  end
  longest_book
end

def recommended_books(array, num)
  array.sort_by {|book| book[:pages]}.slice(0, num)
end

def recommended_books_by_genre(array, preferred_genre, non_preferred_genre)
  new_array = []
  array.each do |book|
    unless book[:genres].include?(non_preferred_genre)
      if book[:genres].include?(preferred_genre)
        new_array.unshift("Since you like #{preferred_genre}, you should read #{book[:title]} by #{book[:author]}!")
      else
        new_array.push("I also recommend #{book[:title]} by #{book[:author]}.")
      end
    end
  end
  new_array

end

# WRITE CODE ABOVE HERE


# binding.pry

# puts "Books!"


# testing out the functions

# all_pages(library)
# puts all_pages_read(library)
# puts all_genres(library)
# puts books_read(library)
# completed_books_detail(library)
# puts books_in_library(library)
# puts books_with_subtitles(library)
# puts books_by_year(library)
# puts books_primary_title(library)
# puts highest_page_count(library)
# puts recommended_books(library, 1)
# puts recommended_books_by_genre(library, "Historical Fiction", "Science Fiction")