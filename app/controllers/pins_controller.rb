class PinsController < ApplicationController
  before_action :set_pin, only: [:update, :show, :destroy]
  def index
    @board = Board.new
    @pins = Pin.order("created_at DESC").page(params[:page]).per(20).includes(:board_pins)
    respond_to do |format|
      format.html
      format.json {
        @search_pins = Pin.where('title LIKE(?)', "%#{params[:content]}%").limit(5)
      }
    end
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
    else
    end
  end

  def update
    @pin.update(pin_params)
    redirect_to @pin
  end

  def show
    @lBoard = @pin.board_pins.includes(:board).last.board if @pin.board_pins.present?
  end

  def destroy
    @pin.destroy
  end

  private
  def pin_params
    params.require(:pin).permit(:title, :image, :description).merge(user_id: current_user.id)
  end

  def set_pin
    @pin = Pin.find(params[:id])
  end
end
