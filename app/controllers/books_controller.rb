class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def index
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end


  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
