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

  def user_params
  	params.require(:user).permit(:name_first, :name_last, :name_first_phonetic, :name_last_phonetic, :profile_image, :introduction, :post_code, :address, :phone, :admin, :quit_flag)
  end
end
