class BoardPinsController < ApplicationController
  def create
    @board_pin = BoardPin.create(board_pin_params)
  end

  def destroy
    @board_pin = BoardPin.find(params[:id])
    if @board_pin.destroy
      redirect_to(:back, notice: "「" + @board_pin.pin.title + "」を削除しました")
    else
      redirect_to :back, flash:{ errors: @board_pin.errors.full_messages }
    end
  end

  private
  def board_pin_params
    params.permit(:board_id, :pin_id)
  end
end
