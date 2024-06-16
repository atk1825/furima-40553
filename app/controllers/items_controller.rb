class ItemsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update]
  before_action :move_to_sign_in, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order('id  DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  private

  def find_params
    @item = Item.find(params[:id])
  end

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_index
    return if current_user.id == @item.user.id

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:name, :content, :image, :price, :category_id, :condition_id, :area_id, :load_id,
                                 :delivery_id).merge(user_id: current_user.id)
  end
end
