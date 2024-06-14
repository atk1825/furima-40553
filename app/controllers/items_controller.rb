class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render new, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :content, :image, :price).merge(user_id: current_user.id)
  end
end
