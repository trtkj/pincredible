class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @board = Board.new
    @boards = @user.boards
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to :root
    else
      render :edit
    end
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to :root unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :image, :about)
  end
end
