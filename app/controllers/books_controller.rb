class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book.params)
    
    if @book.save
      redirect_to user_path(current_user)
      flash[:notice] = "You have created book successfully"
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end


  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
