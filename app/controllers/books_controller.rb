class BooksController < ApplicationController
 
  def create
    @book = Book.new(book_params)
     # バリデーションのif文
    if @book.save
      flash[:notice] = 'Book was successfully create.'
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render("books/index")
    end
  end

  def index
    # 投稿のデータを全て取得する 
    @books = Book.all 
    # 新規投稿
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully update.'
      redirect_to book_path(@book.id)
    else
      render("books/edit")
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
