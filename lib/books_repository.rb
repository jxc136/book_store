require_relative './books'
class BooksRepository

  def all
    book_list = []

    sql = 'SELECT id, title, author_name FROM books'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record| 
      books = Books.new
      books.id = record['id']
      books.title = record['title']
      books.author_name = record['author_name']

      book_list << books 
    end 
    return book_list
  end

end  