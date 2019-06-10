class BooksController < ApplicationController

	before_action :set_book_new, only: [:show, :index]
	before_action :authenticate_user!


	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have creatad book successfully."
			redirect_to book_path(@book)
		else
			render :new
		end
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			flash[:notice] = "You have updated book successfully."
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
		@book.user_id = current_user.id
		@user = User.find(params[:id])
	end

	def set_book_new
		@book = Book.new
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
