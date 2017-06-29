class BoardsController < ApplicationController
  def index
    respond_to do |format|
      format.json {
        @search_boards = Board.where('title LIKE(?)', "%#{params[:content]}%").limit(5)
      }
    end
  end

  def show
    @board = Board.find(params[:id])
    @board_pins = @board.board_pins.page(params[:page]).per(20)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
    end
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to @board
    else
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :description).merge(user_id: current_user.id)
  end
end
