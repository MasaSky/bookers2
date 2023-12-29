class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "You have created book successfully"
    else
       render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user.id)
  end


  private

  def book_params
    params.require(:book).permit(:title, :opinion, :book)
  end

end
