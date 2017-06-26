class BoardPinsController < ApplicationController
  def create
    @board_pin = BoardPin.new(board_pin_params)
    if @board_pin.save
    else
      binding.pry
    end
  end

  def destroy
  end

  private
  def board_pin_params
    params.permit(:board_id, :pin_id)
  end
end
