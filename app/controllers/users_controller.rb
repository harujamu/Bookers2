class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user-params)
    if @user.save
      redirect_to action:index
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
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to_book_path
  end
  
  private
  
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
