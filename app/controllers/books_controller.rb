class BooksController < ApplicationController
  
  def index
    @book = Book.new(book_params)
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to '/books'
    else
      flash.now[:alert] = "Failed to create book."
      @books = Book.all
      render :index
    end
  end  

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end  
  
  private
  
  def book_params
    params.permit(:title, :body)
  end
  
end
