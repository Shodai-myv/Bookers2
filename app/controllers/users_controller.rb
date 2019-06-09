class UsersController < ApplicationController
	before_action :set_book_new, only: [:show, :index]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  def set_book_new
	@book = Book.new
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
end
