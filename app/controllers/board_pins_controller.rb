class BoardPinsController < ApplicationController
  def create
    @board_pin = BoardPin.new(board_pin_params)
    if @board_pin.save
    else
    end
  end

  def destroy
    @board_pin = BoardPin.find(params[:id])
    @board_pin.destroy
    redirect_to :back
  end

  private
  def board_pin_params
    params.permit(:board_id, :pin_id)
  end
end
