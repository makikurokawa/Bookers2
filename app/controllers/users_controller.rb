class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      redirect_to user_path(@user.id)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(resource), notice: 'Welcome! You have signed up successfully.'
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :body, :image)
  end
end
