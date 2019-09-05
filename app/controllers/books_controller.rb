class BooksController < ApplicationController

	before_action :authenticate_user!
	before_action :check, only: [:update, :edit]
	before_action :set_book_new, only: [:show, :index]
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have creatad book successfully."
			redirect_to book_path(@book)
		else
			@books = Book.all
			render :index
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path(@book)
		else
			render :edit
		end
	end

	def index
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path
    	flash[:notice] ="You have destroyed book successfully."
	end

	def show
		@book = Book.find(params[:id])
	end

	private
	def set_book_new
		@book = Book.new
	end


	def check
  	book = Book.find(params[:id])
	  if current_user != book.user
	  	redirect_to books_path
	  end
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
