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
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = @user.book
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
  params.require(:user).permit(:name, :introduction, :pofile_image)
  end

end
