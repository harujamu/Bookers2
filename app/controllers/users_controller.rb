class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "successfully"
      redirect_to book_path(current_user)
    else
      render:new
    end
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit 
    @user = User.find(params[:id])
    @books = Book.all
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
