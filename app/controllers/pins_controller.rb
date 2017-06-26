class PinsController < ApplicationController
  def index
    @board = Board.new
    @pins = Pin.order("created_at DESC")
  end

  def create
    @pin = Pin.new(pin_params)
    # binding.pry
    if @pin.save
      # redirect_to @pin
    else
      redirect_to :back
    end
  end

  def update
    @pin = Pin.find(params[:id])
    @pin.update(pin_params)
    redirect_to @pin
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def destroy
  end

  private
  def pin_params
    params.require(:pin).permit(:title, :image, :description).merge(user_id: current_user.id)
  end
end
