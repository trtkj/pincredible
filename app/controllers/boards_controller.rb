class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update]
  def index
    respond_to do |format|
      format.json {
        @search_boards = Board.where('title LIKE(?)', "%#{params[:content]}%").limit(5)
      }
    end
  end

  def show
    @board_pins = @board.board_pins.includes(:pin)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
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
