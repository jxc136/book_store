require 'books_repository'

RSpec.describe BooksRepository do 

  # Testing for database being empty 
  # it "returns all books when there are no books in the databse" do 

  #   repo = BooksRepository.new 
  #   expect(repo.all).to eq []
  # end 

  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end
  

  before(:each) do 
    reset_books_table
  end
  
  it 'returns 4 books' do 

    repo = BooksRepository.new
    books = repo.all
    expect(books.length).to eq 4
    expect(books.first.id).to eq '1'
    expect(books.first.title).to eq 'The Big Sleep'
    expect(books.first.author_name).to eq 'Raymond Chandler'
    expect(books.last.title).to eq 'Goodbye to Berlin'
    expect(books.last.id).to eq '4'
    
  end 

 

end 