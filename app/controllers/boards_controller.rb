class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      binding.pry
    end
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to @board
    else
      binding.pry
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :description).merge(user_id: current_user.id)
  end
end
