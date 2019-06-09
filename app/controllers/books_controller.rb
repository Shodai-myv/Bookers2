class BooksController < ApplicationController

	before_action :set_book_new, only: [:show, :index]


	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book)
		else
			render :new
		end
	end

	def index
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
	end

	def destory
		@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to book_path
	end

	def show
		@book = Book.find(params[:id])
	end

	def set_book_new
		@book = Book.new
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
