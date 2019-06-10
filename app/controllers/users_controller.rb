class UsersController < ApplicationController
	before_action :set_book_new, only: [:show, :index]
	before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
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

  def set_book_new
	@book = Book.new
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
