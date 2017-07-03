class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update]
  def index
    @search_boards = Board.where('title LIKE(?)', "%#{params[:content]}%").limit(5)
  end

  def show
    @board_pins = @board.board_pins.includes(:pin)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to(@board, notice: "ボードを作成しました")
    else
      redirect_to(@board.user, flash: { errors: @board.errors.full_messages })
    end
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_to(@board, flash: { errors: @board.errors.full_messages })
    end
  end

  def destroy
    @board = Board.find(params[:id])
    if @board.destroy
      redirect_to(user_path(current_user), notice: "「" + @board.title + "」を削除しました")
    else
      redirect_to(user_path(current_user), flash:{ errors: @board_pin.errors.full_messages })
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :description).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
