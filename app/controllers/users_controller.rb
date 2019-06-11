class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check, only: [:update, :edit]
	before_action :set_book_new, only: [:show, :index]


  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  	# flash[:notice] = "Welcome! You have signed up successfully."
  end

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	# flash[:notice] = "Welcome! You have signed up successfully."
  	if @user.update(user_params)
		flash[:notice] = "You have updated user successfully."
		redirect_to user_path(@user.id)
	else
		render :edit
	end
  end

  private
  def set_book_new
	@book = Book.new
  end

  def check
  	user = User.find(params[:id])
	  if current_user != user
	  	redirect_to user_path(current_user)
	  end
	end

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
