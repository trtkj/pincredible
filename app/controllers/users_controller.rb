class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    respond_to do |format|
      format.json {
        @search_users = User.where('nickname LIKE(?)', "%#{params[:content]}%").limit(5)
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @board = Board.new
    @boards = @user.boards
    @pins = @user.pins.order("created_at DESC").page(params[:page]).per(20).includes(:board_pins)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to :root unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :avatar, :about, :remote_avatar_url)
  end
end
