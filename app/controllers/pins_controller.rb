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
    @pin = Pin.create(pin_params)
    @pin.extract_tags
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update(pin_params)
      @pin.extract_tags
      redirect_to @pin
    else
      redirect_to(@pin, flash: { errors: @pin.errors.full_messages })
    end
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
