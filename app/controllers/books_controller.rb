class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to_book_path
    else
      render:create
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.all
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to_book_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
    

end
