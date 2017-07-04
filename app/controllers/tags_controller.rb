class TagsController < ApplicationController
  def index
    @tags = Tag.order("name")
    respond_to do |format|
      format.html
      format.json {
        @search_tags = Tag.where('name LIKE(?)', "%#{params[:content]}%").limit(5)
      }
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @pins = @tag.pins.page(params[:page]).per(20)
  end

  def create
  end
end
